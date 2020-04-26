package visuals.ui.elements.leaderboard
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   import visuals.ui.elements.icons.SymbolIconPlusGeneric;
   import visuals.ui.elements.icons.SymbolIconPremiumCurrencyGeneric;
   import visuals.ui.elements.icons.SymbolIconXpGeneric;
   
   public class SymbolLeaderboardMovieLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolLeaderboardMovieLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var txtRank:ILabel = null;
      
      public var txtCharacterName:ILabel = null;
      
      public var iconOnline:SymbolIconOnlineGeneric = null;
      
      public var iconGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var iconRewardXP:SymbolIconXpGeneric = null;
      
      public var iconRewardPremium:SymbolIconPremiumCurrencyGeneric = null;
      
      public var iconRewardStatPoint:SymbolIconPlusGeneric = null;
      
      public function SymbolLeaderboardMovieLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolLeaderboardMovieLine;
         }
         else
         {
            _nativeObject = new SymbolLeaderboardMovieLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         txtRank = FlashLabel.fromNative(_nativeObject.txtRank);
         txtCharacterName = FlashLabel.fromNative(_nativeObject.txtCharacterName);
         iconOnline = new SymbolIconOnlineGeneric(_nativeObject.iconOnline);
         iconGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconGenderFemale);
         iconGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconGenderMale);
         iconRewardXP = new SymbolIconXpGeneric(_nativeObject.iconRewardXP);
         iconRewardPremium = new SymbolIconPremiumCurrencyGeneric(_nativeObject.iconRewardPremium);
         iconRewardStatPoint = new SymbolIconPlusGeneric(_nativeObject.iconRewardStatPoint);
      }
      
      public function setNativeInstance(param1:SymbolLeaderboardMovieLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabel.setNativeInstance(txtRank,_nativeObject.txtRank);
         FlashLabel.setNativeInstance(txtCharacterName,_nativeObject.txtCharacterName);
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         if(_nativeObject.iconGenderFemale)
         {
            iconGenderFemale.setNativeInstance(_nativeObject.iconGenderFemale);
         }
         if(_nativeObject.iconGenderMale)
         {
            iconGenderMale.setNativeInstance(_nativeObject.iconGenderMale);
         }
         if(_nativeObject.iconRewardXP)
         {
            iconRewardXP.setNativeInstance(_nativeObject.iconRewardXP);
         }
         if(_nativeObject.iconRewardPremium)
         {
            iconRewardPremium.setNativeInstance(_nativeObject.iconRewardPremium);
         }
         if(_nativeObject.iconRewardStatPoint)
         {
            iconRewardStatPoint.setNativeInstance(_nativeObject.iconRewardStatPoint);
         }
      }
   }
}
