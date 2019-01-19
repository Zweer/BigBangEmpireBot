import { camelCase } from 'lodash';

export default abstract class DataObject<DataType> {
  constructor(data?: DataType) {
    if (data) {
      this.update(data);
    }
  }

  update(data: DataType | DataObject<DataType>) {
    Object.getOwnPropertyNames(data).forEach((propertyRaw) => {
      const property = camelCase(propertyRaw);
      const setter = camelCase(`set_${property}`);
      const value = data[propertyRaw];

      this[setter] ? this[setter](value) : this[property] = value;
    });
  }
}
