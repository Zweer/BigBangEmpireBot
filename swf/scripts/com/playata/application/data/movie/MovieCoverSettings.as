package com.playata.application.data.movie
{
   import com.playata.application.data.character.AvatarImageSettings;
   
   public class MovieCoverSettings extends AvatarImageSettings
   {
       
      
      public function MovieCoverSettings(param1:Object)
      {
         super(param1);
      }
      
      public static function decodeMovieCoverImageSettings(param1:String) : MovieCoverSettings
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:MovieCoverSettings = new MovieCoverSettings({});
         var _loc4_:Array = param1.split(";");
         var _loc12_:int = 0;
         var _loc11_:* = _loc4_;
         for each(var _loc8_ in _loc4_)
         {
            _loc3_ = _loc8_.split(":");
            _loc5_ = _loc3_[0];
            _loc9_ = _loc3_[1];
            var _loc10_:* = _loc5_;
            switch(_loc10_)
            {
               case "g":
                  _loc2_.gender = _loc9_;
                  continue;
               case "t":
                  _loc2_.title = _loc9_;
                  continue;
               case "c":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["cover_rect_type","cover_border_type","cover_background_type","cover_layout_type","cover_actor_type"],_loc2_);
                  continue;
               case "c2":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["cover_filter_type","cover_layout_new_type","cover_font_type"],_loc2_);
                  continue;
               case "s":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["skin_color","head_type","eyes_type","nose_type","mouth_type"],_loc2_);
                  continue;
               case "b":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["hair_type","hair_color","eyebrows_type","facial_hair_type","decoration_type"],_loc2_);
                  continue;
               case "b2":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["eyebrows_color","facial_hair_color"],_loc2_);
                  continue;
               case "tt":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["tattoo_arm_left","tattoo_arm_right","tattoo_body","tattoo_leg_left","tattoo_leg_right"],_loc2_);
                  continue;
               case "uw":
                  AvatarImageSettings.decodeAppearanceCode(parseInt(_loc9_),["bra_type","panties_type","genitals_type","genitals_hair_type","genitals_hair_color"],_loc2_);
                  continue;
               case "ih":
                  _loc2_.head = _loc9_;
                  continue;
               case "ic":
                  _loc2_.chest = _loc9_;
                  continue;
               case "ib":
                  _loc2_.belt = _loc9_;
                  continue;
               case "il":
                  _loc2_.legs = _loc9_;
                  continue;
               case "ibo":
                  _loc2_.boots = _loc9_;
                  continue;
               case "bq":
                  _loc2_.bra_quality = _loc9_;
                  continue;
               case "ht":
                  _loc2_.deleteData("title");
                  _loc2_.hideTitle = true;
                  continue;
               default:
                  continue;
            }
         }
         if(!_loc2_.hasData("hideTitle") || !_loc2_.hideTitle)
         {
            _loc6_ = param1.indexOf(";t:");
            _loc7_ = param1.indexOf(";b:");
            _loc2_.title = param1.substring(_loc6_ + 3,_loc7_);
         }
         if(!_loc2_.hasData("cover_actor_type"))
         {
            _loc2_.cover_actor_type = 1;
         }
         if(!_loc2_.hasData("cover_filter_type"))
         {
            _loc2_.cover_filter_type = 1;
         }
         if(!_loc2_.hasData("eyebrows_color"))
         {
            _loc2_.eyebrows_color = _loc2_.hair_color;
         }
         if(!_loc2_.hasData("facial_hair_color"))
         {
            _loc2_.facial_hair_color = _loc2_.hair_color;
         }
         return _loc2_;
      }
      
      public function set title(param1:String) : void
      {
         setString("title",param1);
      }
      
      public function get title() : String
      {
         return getString("title");
      }
      
      public function set hideTitle(param1:Boolean) : void
      {
         setBoolean("hideTitle",param1);
      }
      
      public function get hideTitle() : Boolean
      {
         return getBoolean("hideTitle");
      }
      
      public function set cover_actor_type(param1:int) : void
      {
         setInt("cover_actor_type",param1);
      }
      
      public function get cover_actor_type() : int
      {
         return getInt("cover_actor_type");
      }
   }
}
