package spine
{
   public class BlendMode
   {
      
      public static const normal:BlendMode = new BlendMode(0);
      
      public static const additive:BlendMode = new BlendMode(1);
      
      public static const multiply:BlendMode = new BlendMode(2);
      
      public static const screen:BlendMode = new BlendMode(3);
       
      
      public var ordinal:int;
      
      public function BlendMode(param1:int)
      {
         super();
         this.ordinal = param1;
      }
   }
}
