package com.allandequeiroz;

import org.graalvm.polyglot.Context;
import org.graalvm.polyglot.Value;

public class Main {
    public static void main(String[] args) {
        try (Context context = Context.create("js")) {
            Value parse = context.eval("js", "weatherServer.js");
            System.out.println(parse);
        }
    }
}
