package spine.animation
{
   import spine.Event;
   import spine.Skeleton;
   
   public interface Timeline
   {
       
      
      function apply(param1:Skeleton, param2:Number, param3:Number, param4:Vector.<Event>, param5:Number, param6:Boolean, param7:Boolean) : void;
      
      function getPropertyId() : int;
   }
}
