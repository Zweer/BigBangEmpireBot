export default class BigBangEmpireError extends Error {
  constructor(public code: string, public action: string, public params: object) {
    super(`${code} @ ${action} ${JSON.stringify(params)}`);
  }
}
