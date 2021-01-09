package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CMovieRating extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "movie_ratings";
      
      public static const ID_NAME:String = "index";
       
      
      public function CMovieRating(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("movie_ratings");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("movie_ratings");
      }
      
      public static function get ids() : Vector.<int>
      {
         return ConstantsData.getIntVectorIds("movie_ratings");
      }
      
      public static function exists(param1:int) : Boolean
      {
         return ConstantsData.getIdExists("movie_ratings",param1);
      }
      
      public static function fromId(param1:int) : CMovieRating
      {
         return ConstantsData.getConstantsDataObject(param1,CMovieRating) as CMovieRating;
      }
      
      public function get index() : int
      {
         return getInt("index");
      }
      
      public function get stars() : int
      {
         return getInt("stars");
      }
      
      public function get neededProgress() : int
      {
         return getInt("needed_progress");
      }
      
      public function get rewardFactor() : Number
      {
         return getNumber("reward_factor");
      }
      
      public function get fansFactor() : Number
      {
         return getNumber("fans_factor");
      }
      
      public function get specialFactor() : Number
      {
         return getNumber("special_factor");
      }
      
      public function get streamingResourceChance() : Number
      {
         return getNumber("streaming_resource_chance");
      }
      
      public function get streamingResourceFactor() : int
      {
         return getInt("streaming_resource_factor");
      }
   }
}
