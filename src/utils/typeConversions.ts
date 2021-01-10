import { DateTime } from 'luxon';
import { plainToClass } from 'class-transformer';

export function stringToInt(value: string | number): number {
  return typeof value === 'string' ? parseInt(value, 10) : value;
}

export function secondsToDateTime(value: number | DateTime): DateTime {
  return typeof value === 'number' ? DateTime.fromSeconds(value) : value;
}

export function datetimeToDateTime(value: string | DateTime): DateTime {
  return typeof value === 'string' ? DateTime.fromSQL(value) : value;
}

export function stringToModel(model) {
  return function transformStringToModel(value: string | typeof model | object): typeof model {
    if (value instanceof model) {
      return value;
    }

    return plainToClass(model, typeof value === 'string' ? JSON.parse(value) : value);
  };
}

export function objectOfObjectsToArrayOfModels(model, keyName = 'identifier') {
  return (values: (typeof model)[] | object) => (Array.isArray(values) ? values : Object.entries(values)
    .map(([key, value]) => plainToClass(model, { [keyName]: key, ...value })));
}

export function arrayOfObjectsOfObjectsToArrayOfModels(model, keyName = 'identifier', sort = null) {
  return (values: object[]) => (values[0][keyName] ? values : values
    .map((singleValue) => Object.entries(singleValue)
      .map(([key, value]) => plainToClass(model, { [keyName]: key, ...value })))
    .flat()
    .sort(sort || ((a, b) => (a[keyName] > b[keyName] ? 1 : -1))));
}
