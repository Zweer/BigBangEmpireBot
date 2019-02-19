import constants from '../constants';

export function calculateStatCost(boughtStat: number): number {
  return Math.round(constants.costStatBase + (constants.costStatScale * ((constants.costStatBaseScale * boughtStat) ** constants.costStatBaseExp)));
}
