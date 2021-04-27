module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  plugins: ["@typescript-eslint"],
  extends: ["standard-with-typescript", "prettier"],
  parserOptions: {
    project: "tsconfig.json",
  },
  rules: {
    "no-console": ["error"],
    "@typescript-eslint/restrict-template-expressions": 0,
    "@typescript-eslint/explicit-function-return-type": 0,
    "@typescript-eslint/strict-boolean-expressions": 0,
    "@typescript-eslint/consistent-type-assertions": 0,
    "@typescript-eslint/no-misused-promises": [
      "error",
      {
        checksVoidReturn: false,
      },
    ],
  },
  ignorePatterns: ["prisma", "dist/", ".eslintrc.js", "jest.config.js"],
};
