package spine
{
   public class TransformMode
   {
      
      public static const normal:TransformMode = new TransformMode();
      
      public static const onlyTranslation:TransformMode = new TransformMode();
      
      public static const noRotationOrReflection:TransformMode = new TransformMode();
      
      public static const noScale:TransformMode = new TransformMode();
      
      public static const noScaleOrReflection:TransformMode = new TransformMode();
       
      
      public function TransformMode()
      {
         super();
      }
   }
}
