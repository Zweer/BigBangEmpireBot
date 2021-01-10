import { DateTime } from 'luxon';
import { plainToClass } from 'class-transformer';

export function stringToInt(value: string | number): number {
  return typeof value === 'string' ? parseInt(value, 10) : value;
}

export function secondsToDateTime(value: number | DateTime | object): DateTime {
  if (typeof value === 'number') {
    return DateTime.fromSeconds(value);
  }

  return value instanceof DateTime ? value : DateTime.fromMillis(value.ts);
}

export function datetimeToDateTime(value: string | DateTime | object): DateTime {
  if (typeof value === 'string') {
    return DateTime.fromSQL(value);
  }

  return value instanceof DateTime ? value : DateTime.fromMillis(value.ts);
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
  return function transformArrayOfObjectsOfObjectsToArrayOfModels(values: object[]) {
    if (values[0] instanceof model) {
      return values;
    }

    if (values[0][keyName]) {
      return plainToClass(model, values);
    }

    return values
      .map((singleValue) => Object.entries(singleValue)
        .map(([key, value]) => plainToClass(model, { [keyName]: key, ...value })))
      .flat()
      .sort(sort || ((a, b) => (a[keyName] > b[keyName] ? 1 : -1)));
  };
}
