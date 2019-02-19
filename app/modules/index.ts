export default abstract class AbstractModule {
  abstract async handle(): Promise<void>;
}
