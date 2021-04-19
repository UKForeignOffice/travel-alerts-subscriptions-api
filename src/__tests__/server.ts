import { server, startServer } from "../server";
import { PORT } from "../config";
import * as http from "http";

describe("startServer", () => {
  it("calls server listen", () => {
    jest
      .spyOn(server, "listen")
      .mockImplementation(() => (undefined as unknown) as http.Server);
    startServer();
    expect(server.listen).toHaveBeenCalledWith(PORT, expect.anything());
  });
});
