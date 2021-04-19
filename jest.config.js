module.exports = {
  clearMocks: true,
  coverageDirectory: "coverage",
  collectCoverageFrom: ["src/**/*.{ts}"],
  coverageReporters: ["json", "text"],
  errorOnDeprecated: true,
  moduleFileExtensions: ["ts", "js"],
  rootDir: "src",
  testEnvironment: "node",
  transform: {
    "^.+\\.ts?$": "babel-jest",
  },
};
