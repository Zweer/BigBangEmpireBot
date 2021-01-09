package spine.animation
{
   public class TimelineType
   {
      
      public static const rotate:TimelineType = new TimelineType(0);
      
      public static const translate:TimelineType = new TimelineType(1);
      
      public static const scale:TimelineType = new TimelineType(2);
      
      public static const shear:TimelineType = new TimelineType(3);
      
      public static const attachment:TimelineType = new TimelineType(4);
      
      public static const color:TimelineType = new TimelineType(5);
      
      public static const deform:TimelineType = new TimelineType(6);
      
      public static const event:TimelineType = new TimelineType(7);
      
      public static const drawOrder:TimelineType = new TimelineType(8);
      
      public static const ikConstraint:TimelineType = new TimelineType(9);
      
      public static const transformConstraint:TimelineType = new TimelineType(10);
      
      public static const pathConstraintPosition:TimelineType = new TimelineType(11);
      
      public static const pathConstraintSpacing:TimelineType = new TimelineType(12);
      
      public static const pathConstraintMix:TimelineType = new TimelineType(13);
       
      
      public var ordinal:int;
      
      public function TimelineType(param1:int)
      {
         super();
         this.ordinal = param1;
      }
   }
}
