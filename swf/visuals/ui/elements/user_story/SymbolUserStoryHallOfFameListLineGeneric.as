package visuals.ui.elements.user_story
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolIconButtonReportGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineHighlightGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderFemaleGeneric;
   import visuals.ui.elements.icons.SymbolIconGenderMaleGeneric;
   
   public class SymbolUserStoryHallOfFameListLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUserStoryHallOfFameListLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineHighlightGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGenericListLineOddGeneric = null;
      
      public var iconGenderFemale:SymbolIconGenderFemaleGeneric = null;
      
      public var iconGenderMale:SymbolIconGenderMaleGeneric = null;
      
      public var txtServerId:ILabel = null;
      
      public var txtName:ILabel = null;
      
      public var iconLocale:SymbolIconFlagGeneric = null;
      
      public var iconTag:SymbolUserStoryTagIconGeneric = null;
      
      public var txtStage:ILabelArea = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var txtDate:ILabelArea = null;
      
      public var iconServer:SymbolIconFlagGeneric = null;
      
      public var btnReport:SymbolIconButtonReportGeneric = null;
      
      public function SymbolUserStoryHallOfFameListLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUserStoryHallOfFameListLine;
         }
         else
         {
            _nativeObject = new SymbolUserStoryHallOfFameListLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineHighlightGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundOdd);
         iconGenderFemale = new SymbolIconGenderFemaleGeneric(_nativeObject.iconGenderFemale);
         iconGenderMale = new SymbolIconGenderMaleGeneric(_nativeObject.iconGenderMale);
         txtServerId = FlashLabel.fromNative(_nativeObject.txtServerId);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         iconLocale = new SymbolIconFlagGeneric(_nativeObject.iconLocale);
         iconTag = new SymbolUserStoryTagIconGeneric(_nativeObject.iconTag);
         txtStage = FlashLabelArea.fromNative(_nativeObject.txtStage);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         txtDate = FlashLabelArea.fromNative(_nativeObject.txtDate);
         iconServer = new SymbolIconFlagGeneric(_nativeObject.iconServer);
         btnReport = new SymbolIconButtonReportGeneric(_nativeObject.btnReport);
      }
      
      public function setNativeInstance(param1:SymbolUserStoryHallOfFameListLine) : void
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
         if(_nativeObject.iconGenderFemale)
         {
            iconGenderFemale.setNativeInstance(_nativeObject.iconGenderFemale);
         }
         if(_nativeObject.iconGenderMale)
         {
            iconGenderMale.setNativeInstance(_nativeObject.iconGenderMale);
         }
         FlashLabel.setNativeInstance(txtServerId,_nativeObject.txtServerId);
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         if(_nativeObject.iconTag)
         {
            iconTag.setNativeInstance(_nativeObject.iconTag);
         }
         FlashLabelArea.setNativeInstance(txtStage,_nativeObject.txtStage);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtDate,_nativeObject.txtDate);
         if(_nativeObject.iconServer)
         {
            iconServer.setNativeInstance(_nativeObject.iconServer);
         }
         if(_nativeObject.btnReport)
         {
            btnReport.setNativeInstance(_nativeObject.btnReport);
         }
      }
   }
}
