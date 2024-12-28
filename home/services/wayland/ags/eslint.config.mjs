import typescriptEslint from "@typescript-eslint/eslint-plugin";
import tsParser from "@typescript-eslint/parser";
import path from "node:path";
import { fileURLToPath } from "node:url";
import js from "@eslint/js";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const compat = new FlatCompat({
    baseDirectory: __dirname,
    recommendedConfig: js.configs.recommended,
    allConfig: js.configs.all,
});

export default [{
    ignores: [
        "**/types/",
        "**/node_modules/",
        "**/bin/",
        "**/outputs/",
        "**/result/",
        "**/style/",
    ],
}, ...compat.extends("eslint:recommended", "plugin:@typescript-eslint/recommended"), {
    plugins: {
        "@typescript-eslint": typescriptEslint,
    },

    languageOptions: {
        globals: {
            globalThis: "readonly",
            imports: "readonly",
            Intl: "readonly",
            log: "readonly",
            logError: "readonly",
            print: "readonly",
            printerr: "readonly",
            console: "readonly",
        },

        parser: tsParser,
        ecmaVersion: 2022,
        sourceType: "module",

        parserOptions: {
            project: "./tsconfig.json",
            warnOnUnsupportedTypeScriptVersion: false,
        },
    },

    rules: {
        "@typescript-eslint/ban-ts-comment": ["off"],
        "@typescript-eslint/no-non-null-assertion": ["off"],
        "@typescript-eslint/no-explicit-any": ["off"],

        "@typescript-eslint/no-unused-vars": ["error", {
            varsIgnorePattern: "(^unused|_$)",
            argsIgnorePattern: "^(unused|_)",
        }],

        "@typescript-eslint/no-empty-interface": ["off"],
        "comma-dangle": ["error", "always-multiline"],

        "comma-spacing": ["error", {
            before: false,
            after: true,
        }],

        "comma-style": ["error", "last"],
        curly: ["error", "multi-or-nest", "consistent"],
        "dot-location": ["error", "property"],
        "eol-last": ["error"],

        indent: ["error", 4, {
            SwitchCase: 1,
        }],

        "keyword-spacing": ["error", {
            before: true,
        }],

        "lines-between-class-members": ["error", "always", {
            exceptAfterSingleLine: true,
        }],

        "padded-blocks": ["error", "never", {
            allowSingleLineBlocks: false,
        }],

        "prefer-const": ["error"],

        quotes: ["error", "double", {
            avoidEscape: true,
        }],

        semi: ["error", "always"],
        "nonblock-statement-body-position": ["error", "below"],
        "no-trailing-spaces": ["error"],
        "no-useless-escape": ["off"],

        "max-len": ["error", {
            code: 100,
        }],

        "func-call-spacing": ["error"],
        "array-bracket-spacing": ["error"],
        "space-before-blocks": ["error"],
        "key-spacing": ["error"],
        "object-curly-spacing": ["error", "always"],
    },
}];
