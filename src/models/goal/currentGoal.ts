export class CurrentGoal {
  identifier: string;

  value: number;

  current_value: number;

  isCompleted(): boolean { return this.value === this.current_value && this.value !== 0; }
}
