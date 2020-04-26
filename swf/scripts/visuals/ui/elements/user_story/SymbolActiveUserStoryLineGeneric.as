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
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.icons.SymbolIconFlagGeneric;
   
   public class SymbolActiveUserStoryLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolActiveUserStoryLine = null;
      
      public var background:SymbolGenericListLineOddGeneric = null;
      
      public var iconLocale:SymbolIconFlagGeneric = null;
      
      public var iconTag:SymbolUserStoryTagIconGeneric = null;
      
      public var txtStage:ILabel = null;
      
      public var txtTitle:ILabelArea = null;
      
      public function SymbolActiveUserStoryLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolActiveUserStoryLine;
         }
         else
         {
            _nativeObject = new SymbolActiveUserStoryLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolGenericListLineOddGeneric(_nativeObject.background);
         iconLocale = new SymbolIconFlagGeneric(_nativeObject.iconLocale);
         iconTag = new SymbolUserStoryTagIconGeneric(_nativeObject.iconTag);
         txtStage = FlashLabel.fromNative(_nativeObject.txtStage);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
      }
      
      public function setNativeInstance(param1:SymbolActiveUserStoryLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.iconLocale)
         {
            iconLocale.setNativeInstance(_nativeObject.iconLocale);
         }
         if(_nativeObject.iconTag)
         {
            iconTag.setNativeInstance(_nativeObject.iconTag);
         }
         FlashLabel.setNativeInstance(txtStage,_nativeObject.txtStage);
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
      }
   }
}
