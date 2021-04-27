module.exports = {
  clearMocks: true,
  coverageDirectory: "coverage",
  collectCoverageFrom: ["**/*.ts", "!**/*.d.ts", "!**/seed.ts"],
  coverageReporters: ["json", "text"],
  errorOnDeprecated: true,
  moduleFileExtensions: ["ts", "js"],
  rootDir: "src",
  testEnvironment: "node",
  verbose: true,
  transform: {
    "^.+\\.ts?$": "babel-jest",
  },
  setupFilesAfterEnv: ["<rootDir>/.jest/setup.ts"],
};
