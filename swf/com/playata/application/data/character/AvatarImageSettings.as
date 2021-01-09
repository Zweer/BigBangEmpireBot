package com.playata.application.data.character
{
   import com.playata.framework.core.util.NumberUtil;
   
   public class AvatarImageSettings extends AppearanceSettings
   {
       
      
      public function AvatarImageSettings(param1:Object)
      {
         super(param1);
      }
      
      public static function decodeAvatarImageSettings(param1:String) : AvatarImageSettings
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc2_:AvatarImageSettings = new AvatarImageSettings({});
         var _loc4_:Array = param1.split(";");
         var _loc10_:int = 0;
         var _loc9_:* = _loc4_;
         for each(var _loc6_ in _loc4_)
         {
            _loc3_ = _loc6_.split(":");
            _loc5_ = _loc3_[0];
            _loc7_ = _loc3_[1];
            var _loc8_:* = _loc5_;
            switch(_loc8_)
            {
               case "g":
                  _loc2_.gender = _loc7_;
                  continue;
               case "p":
                  decodeAppearanceCode(parseInt(_loc7_),["photo_rect_type","photo_border_type","photo_background_type","photo_filter_type","photo_icon_type"],_loc2_);
                  continue;
               case "p2":
                  decodeAppearanceCode(parseInt(_loc7_),["photo_sexuality_type"],_loc2_);
                  continue;
               case "s":
                  decodeAppearanceCode(parseInt(_loc7_),["skin_color","head_type","eyes_type","nose_type","mouth_type"],_loc2_);
                  continue;
               case "b":
                  decodeAppearanceCode(parseInt(_loc7_),["hair_type","hair_color","eyebrows_type","facial_hair_type","decoration_type"],_loc2_);
                  continue;
               case "b2":
                  decodeAppearanceCode(parseInt(_loc7_),["eyebrows_color","facial_hair_color"],_loc2_);
                  continue;
               case "tt":
                  decodeAppearanceCode(parseInt(_loc7_),["tattoo_arm_left","tattoo_arm_right","tattoo_body","tattoo_leg_left","tattoo_leg_right"],_loc2_);
                  continue;
               case "uw":
                  decodeAppearanceCode(parseInt(_loc7_),["bra_type","panties_type","genitals_type","genitals_hair_type","genitals_hair_color"],_loc2_);
                  continue;
               case "ih":
                  _loc2_.head = _loc7_;
                  continue;
               case "ic":
                  _loc2_.chest = _loc7_;
                  continue;
               case "ib":
                  _loc2_.belt = _loc7_;
                  continue;
               case "il":
                  _loc2_.legs = _loc7_;
                  continue;
               case "ibo":
                  _loc2_.boots = _loc7_;
                  continue;
               case "bq":
                  _loc2_.bra_quality = _loc7_;
                  continue;
               default:
                  continue;
            }
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
      
      public static function decodeAppearanceCode(param1:int, param2:Array, param3:AvatarImageSettings) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc4_:int = 63;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            _loc6_ = param1 >> _loc5_ * 6 & _loc4_;
            if(param2[_loc5_] == "cover_layout_type")
            {
               if(!param3.hasData("cover_layout_new_type"))
               {
                  param3.cover_layout_new_type = NumberUtil.clamp(Math.ceil(_loc6_ / 3),1,14);
               }
               if(!param3.hasData("cover_font_type"))
               {
                  param3.cover_font_type = _loc6_ % 3;
                  if(param3.cover_font_type == 0)
                  {
                     param3.cover_font_type = 3;
                  }
               }
            }
            else if(param2[_loc5_] == "cover_layout_new_type")
            {
               if(_loc6_ > 0 || !param3.hasData("cover_layout_new_type"))
               {
                  param3.setData(param2[_loc5_],_loc6_);
               }
            }
            else if(param2[_loc5_] == "cover_font_type")
            {
               if(_loc6_ > 0 || !param3.hasData("cover_font_type"))
               {
                  param3.setData(param2[_loc5_],_loc6_);
               }
            }
            else
            {
               param3.setData(param2[_loc5_],_loc6_);
            }
            _loc5_++;
         }
      }
      
      public function get photo_border_type() : int
      {
         return getInt("photo_border_type");
      }
      
      public function set photo_border_type(param1:int) : void
      {
         setInt("photo_border_type",param1);
      }
      
      public function get photo_icon_type() : int
      {
         return getInt("photo_icon_type");
      }
      
      public function set photo_icon_type(param1:int) : void
      {
         setInt("photo_icon_type",param1);
      }
      
      public function get photo_sexuality_type() : int
      {
         return getInt("photo_sexuality_type");
      }
      
      public function set photo_sexuality_type(param1:int) : void
      {
         setInt("photo_sexuality_type",param1);
      }
      
      public function get photo_filter_type() : int
      {
         return getInt("photo_filter_type");
      }
      
      public function set photo_filter_type(param1:int) : void
      {
         setInt("photo_filter_type",param1);
      }
      
      public function get photo_background_type() : int
      {
         return getInt("photo_background_type");
      }
      
      public function set photo_background_type(param1:int) : void
      {
         setInt("photo_background_type",param1);
      }
      
      public function set cover_rect_type(param1:int) : void
      {
         setInt("cover_rect_type",param1);
      }
      
      public function get cover_rect_type() : int
      {
         return getInt("cover_rect_type");
      }
      
      public function set cover_background_type(param1:int) : void
      {
         setInt("cover_background_type",param1);
      }
      
      public function get cover_background_type() : int
      {
         return getInt("cover_background_type");
      }
      
      public function set cover_border_type(param1:int) : void
      {
         setInt("cover_border_type",param1);
      }
      
      public function get cover_border_type() : int
      {
         return getInt("cover_border_type");
      }
      
      public function set cover_layout_new_type(param1:int) : void
      {
         setInt("cover_layout_new_type",param1);
      }
      
      public function get cover_layout_new_type() : int
      {
         return getInt("cover_layout_new_type");
      }
      
      public function set cover_font_type(param1:int) : void
      {
         setInt("cover_font_type",param1);
      }
      
      public function get cover_font_type() : int
      {
         return getInt("cover_font_type");
      }
      
      public function set cover_filter_type(param1:int) : void
      {
         setInt("cover_filter_type",param1);
      }
      
      public function get cover_filter_type() : int
      {
         return getInt("cover_filter_type");
      }
   }
}
