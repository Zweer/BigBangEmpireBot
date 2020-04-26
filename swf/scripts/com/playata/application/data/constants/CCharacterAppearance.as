package com.playata.application.data.constants
{
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.data.constants.ConstantsData;
   
   public class CCharacterAppearance extends ConstantsData
   {
      
      public static const CONSTANTS_KEY:String = "character_appearances";
      
      public static const ID_NAME:String = "id";
       
      
      public function CCharacterAppearance(param1:TypedObject)
      {
         super(param1);
      }
      
      public static function get constantsData() : *
      {
         return ConstantsData.getConstantsData("character_appearances");
      }
      
      public static function get count() : int
      {
         return ConstantsData.getCount("character_appearances");
      }
      
      public static function get ids() : Vector.<String>
      {
         return ConstantsData.getStringVectorIds("character_appearances");
      }
      
      public static function exists(param1:String) : Boolean
      {
         return ConstantsData.getIdExists("character_appearances",param1);
      }
      
      public static function fromId(param1:String) : CCharacterAppearance
      {
         return ConstantsData.getConstantsDataObject(param1,CCharacterAppearance) as CCharacterAppearance;
      }
      
      public function get id() : String
      {
         return getString("id");
      }
      
      public function get skinColor() : Vector.<int>
      {
         return getIntVector("skin_color");
      }
      
      public function get skinColorChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("skin_color_change_required_level");
      }
      
      public function get skinColorChangeCostCoins() : Vector.<int>
      {
         return getIntVector("skin_color_change_cost_coins");
      }
      
      public function get skinColorChangeCostPremium() : Vector.<int>
      {
         return getIntVector("skin_color_change_cost_premium");
      }
      
      public function get hairType() : Vector.<int>
      {
         return getIntVector("hair_type");
      }
      
      public function get hairBack() : Vector.<Boolean>
      {
         return getBooleanVector("hair_back");
      }
      
      public function get hairMiddle() : Vector.<Boolean>
      {
         return getBooleanVector("hair_middle");
      }
      
      public function get hairTypeStyle() : Vector.<int>
      {
         return getIntVector("hair_type_style");
      }
      
      public function get hairTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("hair_type_change_required_level");
      }
      
      public function get hairTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("hair_type_change_cost_coins");
      }
      
      public function get hairTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("hair_type_change_cost_premium");
      }
      
      public function get hairColor() : Vector.<int>
      {
         return getIntVector("hair_color");
      }
      
      public function get hairColorChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("hair_color_change_required_level");
      }
      
      public function get hairColorChangeCostCoins() : Vector.<int>
      {
         return getIntVector("hair_color_change_cost_coins");
      }
      
      public function get hairColorChangeCostPremium() : Vector.<int>
      {
         return getIntVector("hair_color_change_cost_premium");
      }
      
      public function get headType() : Vector.<int>
      {
         return getIntVector("head_type");
      }
      
      public function get headTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("head_type_change_required_level");
      }
      
      public function get headTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("head_type_change_cost_coins");
      }
      
      public function get headTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("head_type_change_cost_premium");
      }
      
      public function get eyesType() : Vector.<int>
      {
         return getIntVector("eyes_type");
      }
      
      public function get eyesTypeStyle() : Vector.<int>
      {
         return getIntVector("eyes_type_style");
      }
      
      public function get eyesTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("eyes_type_change_required_level");
      }
      
      public function get eyesTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("eyes_type_change_cost_coins");
      }
      
      public function get eyesTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("eyes_type_change_cost_premium");
      }
      
      public function get eyebrowsType() : Vector.<int>
      {
         return getIntVector("eyebrows_type");
      }
      
      public function get eyebrowsTypeStyle() : Vector.<int>
      {
         return getIntVector("eyebrows_type_style");
      }
      
      public function get eyebrowsTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("eyebrows_type_change_required_level");
      }
      
      public function get eyebrowsTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("eyebrows_type_change_cost_coins");
      }
      
      public function get eyebrowsTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("eyebrows_type_change_cost_premium");
      }
      
      public function get eyebrowsColor() : Vector.<int>
      {
         return getIntVector("eyebrows_color");
      }
      
      public function get eyebrowsColorChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("eyebrows_color_change_required_level");
      }
      
      public function get eyebrowsColorChangeCostCoins() : Vector.<int>
      {
         return getIntVector("eyebrows_color_change_cost_coins");
      }
      
      public function get eyebrowsColorChangeCostPremium() : Vector.<int>
      {
         return getIntVector("eyebrows_color_change_cost_premium");
      }
      
      public function get noseType() : Vector.<int>
      {
         return getIntVector("nose_type");
      }
      
      public function get noseTypeStyle() : Vector.<int>
      {
         return getIntVector("nose_type_style");
      }
      
      public function get noseTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("nose_type_change_required_level");
      }
      
      public function get noseTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("nose_type_change_cost_coins");
      }
      
      public function get noseTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("nose_type_change_cost_premium");
      }
      
      public function get mouthType() : Vector.<int>
      {
         return getIntVector("mouth_type");
      }
      
      public function get mouthTypeStyle() : Vector.<int>
      {
         return getIntVector("mouth_type_style");
      }
      
      public function get mouthTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("mouth_type_change_required_level");
      }
      
      public function get mouthTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("mouth_type_change_cost_coins");
      }
      
      public function get mouthTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("mouth_type_change_cost_premium");
      }
      
      public function get facialHairType() : Vector.<int>
      {
         return getIntVector("facial_hair_type");
      }
      
      public function get facialHairTypeStyle() : Vector.<int>
      {
         return getIntVector("facial_hair_type_style");
      }
      
      public function get facialHairTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("facial_hair_type_change_required_level");
      }
      
      public function get facialHairTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("facial_hair_type_change_cost_coins");
      }
      
      public function get facialHairTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("facial_hair_type_change_cost_premium");
      }
      
      public function get facialHairColor() : Vector.<int>
      {
         return getIntVector("facial_hair_color");
      }
      
      public function get facialHairColorChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("facial_hair_color_change_required_level");
      }
      
      public function get facialHairColorChangeCostCoins() : Vector.<int>
      {
         return getIntVector("facial_hair_color_change_cost_coins");
      }
      
      public function get facialHairColorChangeCostPremium() : Vector.<int>
      {
         return getIntVector("facial_hair_color_change_cost_premium");
      }
      
      public function get decorationType() : Vector.<int>
      {
         return getIntVector("decoration_type");
      }
      
      public function get decorationTypeStyle() : Vector.<int>
      {
         return getIntVector("decoration_type_style");
      }
      
      public function get decorationTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("decoration_type_change_required_level");
      }
      
      public function get decorationTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("decoration_type_change_cost_coins");
      }
      
      public function get decorationTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("decoration_type_change_cost_premium");
      }
      
      public function get photoRectType() : Vector.<int>
      {
         return getIntVector("photo_rect_type");
      }
      
      public function get photoRectTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("photo_rect_type_change_required_level");
      }
      
      public function get photoRectTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("photo_rect_type_change_cost_coins");
      }
      
      public function get photoRectTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("photo_rect_type_change_cost_premium");
      }
      
      public function get photoBorderType() : Vector.<int>
      {
         return getIntVector("photo_border_type");
      }
      
      public function get photoBorderTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("photo_border_type_change_required_level");
      }
      
      public function get photoBorderTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("photo_border_type_change_cost_coins");
      }
      
      public function get photoBorderTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("photo_border_type_change_cost_premium");
      }
      
      public function get photoBackgroundType() : Vector.<int>
      {
         return getIntVector("photo_background_type");
      }
      
      public function get photoBackgroundTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("photo_background_type_change_required_level");
      }
      
      public function get photoBackgroundTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("photo_background_type_change_cost_coins");
      }
      
      public function get photoBackgroundTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("photo_background_type_change_cost_premium");
      }
      
      public function get photoFilterType() : Vector.<int>
      {
         return getIntVector("photo_filter_type");
      }
      
      public function get photoFilterTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("photo_filter_type_change_required_level");
      }
      
      public function get photoFilterTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("photo_filter_type_change_cost_coins");
      }
      
      public function get photoFilterTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("photo_filter_type_change_cost_premium");
      }
      
      public function get photoIconType() : Vector.<int>
      {
         return getIntVector("photo_icon_type");
      }
      
      public function get photoIconTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("photo_icon_type_change_required_level");
      }
      
      public function get photoIconTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("photo_icon_type_change_cost_coins");
      }
      
      public function get photoIconTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("photo_icon_type_change_cost_premium");
      }
      
      public function get photoSexualityType() : Vector.<int>
      {
         return getIntVector("photo_sexuality_type");
      }
      
      public function get photoSexualityTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("photo_sexuality_type_change_required_level");
      }
      
      public function get photoSexualityTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("photo_sexuality_type_change_cost_coins");
      }
      
      public function get photoSexualityTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("photo_sexuality_type_change_cost_premium");
      }
      
      public function get tattooArmLeft() : Vector.<int>
      {
         return getIntVector("tattoo_arm_left");
      }
      
      public function get tattooArmLeftChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("tattoo_arm_left_change_required_level");
      }
      
      public function get tattooArmLeftChangeCostCoins() : Vector.<int>
      {
         return getIntVector("tattoo_arm_left_change_cost_coins");
      }
      
      public function get tattooArmLeftChangeCostPremium() : Vector.<int>
      {
         return getIntVector("tattoo_arm_left_change_cost_premium");
      }
      
      public function get tattooArmRight() : Vector.<int>
      {
         return getIntVector("tattoo_arm_right");
      }
      
      public function get tattooArmRightChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("tattoo_arm_right_change_required_level");
      }
      
      public function get tattooArmRightChangeCostCoins() : Vector.<int>
      {
         return getIntVector("tattoo_arm_right_change_cost_coins");
      }
      
      public function get tattooArmRightChangeCostPremium() : Vector.<int>
      {
         return getIntVector("tattoo_arm_right_change_cost_premium");
      }
      
      public function get tattooBody() : Vector.<int>
      {
         return getIntVector("tattoo_body");
      }
      
      public function get tattooBodyChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("tattoo_body_change_required_level");
      }
      
      public function get tattooBodyChangeCostCoins() : Vector.<int>
      {
         return getIntVector("tattoo_body_change_cost_coins");
      }
      
      public function get tattooBodyChangeCostPremium() : Vector.<int>
      {
         return getIntVector("tattoo_body_change_cost_premium");
      }
      
      public function get tattooLegLeft() : Vector.<int>
      {
         return getIntVector("tattoo_leg_left");
      }
      
      public function get tattooLegLeftChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("tattoo_leg_left_change_required_level");
      }
      
      public function get tattooLegLeftChangeCostCoins() : Vector.<int>
      {
         return getIntVector("tattoo_leg_left_change_cost_coins");
      }
      
      public function get tattooLegLeftChangeCostPremium() : Vector.<int>
      {
         return getIntVector("tattoo_leg_left_change_cost_premium");
      }
      
      public function get tattooLegRight() : Vector.<int>
      {
         return getIntVector("tattoo_leg_right");
      }
      
      public function get tattooLegRightChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("tattoo_leg_right_change_required_level");
      }
      
      public function get tattooLegRightChangeCostCoins() : Vector.<int>
      {
         return getIntVector("tattoo_leg_right_change_cost_coins");
      }
      
      public function get tattooLegRightChangeCostPremium() : Vector.<int>
      {
         return getIntVector("tattoo_leg_right_change_cost_premium");
      }
      
      public function get braType() : Vector.<int>
      {
         return getIntVector("bra_type");
      }
      
      public function get braTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("bra_type_change_required_level");
      }
      
      public function get braTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("bra_type_change_cost_coins");
      }
      
      public function get braTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("bra_type_change_cost_premium");
      }
      
      public function get pantiesType() : Vector.<int>
      {
         return getIntVector("panties_type");
      }
      
      public function get pantiesTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("panties_type_change_required_level");
      }
      
      public function get pantiesTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("panties_type_change_cost_coins");
      }
      
      public function get pantiesTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("panties_type_change_cost_premium");
      }
      
      public function get genitalsType() : Vector.<int>
      {
         return getIntVector("genitals_type");
      }
      
      public function get genitalsTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("genitals_type_change_required_level");
      }
      
      public function get genitalsTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("genitals_type_change_cost_coins");
      }
      
      public function get genitalsTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("genitals_type_change_cost_premium");
      }
      
      public function get genitalsHairType() : Vector.<int>
      {
         return getIntVector("genitals_hair_type");
      }
      
      public function get genitalsHairTypeChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("genitals_hair_type_change_required_level");
      }
      
      public function get genitalsHairTypeChangeCostCoins() : Vector.<int>
      {
         return getIntVector("genitals_hair_type_change_cost_coins");
      }
      
      public function get genitalsHairTypeChangeCostPremium() : Vector.<int>
      {
         return getIntVector("genitals_hair_type_change_cost_premium");
      }
      
      public function get genitalsHairColor() : Vector.<int>
      {
         return getIntVector("genitals_hair_color");
      }
      
      public function get genitalsHairColorChangeRequiredLevel() : Vector.<int>
      {
         return getIntVector("genitals_hair_color_change_required_level");
      }
      
      public function get genitalsHairColorChangeCostCoins() : Vector.<int>
      {
         return getIntVector("genitals_hair_color_change_cost_coins");
      }
      
      public function get genitalsHairColorChangeCostPremium() : Vector.<int>
      {
         return getIntVector("genitals_hair_color_change_cost_premium");
      }
   }
}
