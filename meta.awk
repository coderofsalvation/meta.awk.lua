#!/usr/bin/env -S awk -f 
BEGIN {
    trigger = (ARGC > 2) ? ARGV[2] : "#";
    delete ARGV[2];
    generator = "/tmp/generator.awk";
    print "BEGIN {" > generator;
    trigger_esc = trigger;
    gsub(/[[\]{}()*+?^$|.\\]/, "\\\\&", trigger_esc);
    pattern = trigger_esc ;
}

{
    if ($0 ~ "(^|[ ])" trigger_esc) {
        line = $0;
        sub(".*"pattern, "", line);
        print line >> generator;
    } else {
        gsub(/\\/, "\\\\", $0);
        gsub(/"/, "\\\"", $0);
        print "print \"" $0 "\"" >> generator;
    }
}

END {
    if (NR > 0) {
        print "}" >> generator;
        system("awk -f " generator " ; rm " generator);
    }
}
