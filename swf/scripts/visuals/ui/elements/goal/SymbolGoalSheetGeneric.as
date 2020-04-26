package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolGoalSheetGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalSheet = null;
      
      public var inactiveBackground:SymbolGoalSheetInactiveBackgroundGeneric = null;
      
      public var inactiveBackgroundOver:SymbolGoalSheetInactiveBackgroundGeneric = null;
      
      public var activeBackground:SymbolGoalSheetActiveBackgroundGeneric = null;
      
      public var txtInactiveText:ILabelArea = null;
      
      public var txtActiveText:ILabelArea = null;
      
      public function SymbolGoalSheetGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalSheet;
         }
         else
         {
            _nativeObject = new SymbolGoalSheet();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         inactiveBackground = new SymbolGoalSheetInactiveBackgroundGeneric(_nativeObject.inactiveBackground);
         inactiveBackgroundOver = new SymbolGoalSheetInactiveBackgroundGeneric(_nativeObject.inactiveBackgroundOver);
         activeBackground = new SymbolGoalSheetActiveBackgroundGeneric(_nativeObject.activeBackground);
         txtInactiveText = FlashLabelArea.fromNative(_nativeObject.txtInactiveText);
         txtActiveText = FlashLabelArea.fromNative(_nativeObject.txtActiveText);
      }
      
      public function setNativeInstance(param1:SymbolGoalSheet) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.inactiveBackground)
         {
            inactiveBackground.setNativeInstance(_nativeObject.inactiveBackground);
         }
         if(_nativeObject.inactiveBackgroundOver)
         {
            inactiveBackgroundOver.setNativeInstance(_nativeObject.inactiveBackgroundOver);
         }
         if(_nativeObject.activeBackground)
         {
            activeBackground.setNativeInstance(_nativeObject.activeBackground);
         }
         FlashLabelArea.setNativeInstance(txtInactiveText,_nativeObject.txtInactiveText);
         FlashLabelArea.setNativeInstance(txtActiveText,_nativeObject.txtActiveText);
      }
   }
}
