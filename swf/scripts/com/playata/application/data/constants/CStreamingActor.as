package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CStreamingActor extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "streaming_actors";
      
      public static const ID_NAME:String = "id";
       
      
      public function CStreamingActor(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("streaming_actors");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("streaming_actors");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("streaming_actors");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("streaming_actors",param1);
      }
      
      public static function fromId(param1:int) : CStreamingActor
      {
         return ConstantsData.getConstantsDataObject(param1,CStreamingActor) as CStreamingActor;
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get identifier() : String
      {
         return getString("identifier");
      }
      
      public function get animationIds() : Vector.<int>
      {
         return getSubIntVectorIds("animations");
      }
      
      public function hasAnimationId(param1:int) : Boolean
      {
         return animationIds.indexOf(param1) != -1;
      }
      
      public function getAnimation(param1:int) : CStreamingActorAnimation
      {
         return getSubData("animations",id,param1,CStreamingActorAnimation) as CStreamingActorAnimation;
      }
   }
}
