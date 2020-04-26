package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   import visuals.ui.elements.icons.SymbolIconHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconLevelStarGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineGeneric;
   
   public class SymbolMissedDuelLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMissedDuelLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var iconGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var iconGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconOnline:SymbolIconOnlineGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var txtLevel:ILabelArea = null;
      
      public var iconLevel:SymbolIconLevelStarGeneric = null;
      
      public var txtStatusWon:ILabelArea = null;
      
      public var txtStatusLost:ILabelArea = null;
      
      public var txtHonor:ILabelArea = null;
      
      public var iconHonor:SymbolIconHonorGeneric = null;
      
      public var iconUnread:SymbolIconExclamationMarkGeneric = null;
      
      public function SymbolMissedDuelLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMissedDuelLine;
         }
         else
         {
            _nativeObject = new SymbolMissedDuelLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         iconGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconGenderMale);
         iconGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconGenderFemale);
         iconOnline = new SymbolIconOnlineGeneric(_nativeObject.iconOnline);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         txtLevel = FlashLabelArea.fromNative(_nativeObject.txtLevel);
         iconLevel = new SymbolIconLevelStarGeneric(_nativeObject.iconLevel);
         txtStatusWon = FlashLabelArea.fromNative(_nativeObject.txtStatusWon);
         txtStatusLost = FlashLabelArea.fromNative(_nativeObject.txtStatusLost);
         txtHonor = FlashLabelArea.fromNative(_nativeObject.txtHonor);
         iconHonor = new SymbolIconHonorGeneric(_nativeObject.iconHonor);
         iconUnread = new SymbolIconExclamationMarkGeneric(_nativeObject.iconUnread);
      }
      
      public function setNativeInstance(param1:SymbolMissedDuelLine) : void
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
         if(_nativeObject.iconGenderMale)
         {
            iconGenderMale.setNativeInstance(_nativeObject.iconGenderMale);
         }
         if(_nativeObject.iconGenderFemale)
         {
            iconGenderFemale.setNativeInstance(_nativeObject.iconGenderFemale);
         }
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         FlashLabelArea.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         FlashLabelArea.setNativeInstance(txtStatusWon,_nativeObject.txtStatusWon);
         FlashLabelArea.setNativeInstance(txtStatusLost,_nativeObject.txtStatusLost);
         FlashLabelArea.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         if(_nativeObject.iconUnread)
         {
            iconUnread.setNativeInstance(_nativeObject.iconUnread);
         }
      }
   }
}
