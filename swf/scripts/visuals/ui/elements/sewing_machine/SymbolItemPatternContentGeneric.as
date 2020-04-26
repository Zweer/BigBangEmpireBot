package visuals.ui.elements.sewing_machine
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonGoalFilterGeneric;
   
   public class SymbolItemPatternContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolItemPatternContent = null;
      
      public var info:SymbolItemPatternInfoGeneric = null;
      
      public var txtCount:ILabelArea = null;
      
      public var txtNoPatterns:ILabelArea = null;
      
      public var line1:SymbolItemPatternLineGeneric = null;
      
      public var line2:SymbolItemPatternLineGeneric = null;
      
      public var line3:SymbolItemPatternLineGeneric = null;
      
      public var line4:SymbolItemPatternLineGeneric = null;
      
      public var line5:SymbolItemPatternLineGeneric = null;
      
      public var line6:SymbolItemPatternLineGeneric = null;
      
      public var line7:SymbolItemPatternLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnFilter:SymbolButtonGoalFilterGeneric = null;
      
      public var itemPatternFilter:SymbolItemPatternFilterGeneric = null;
      
      public function SymbolItemPatternContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolItemPatternContent;
         }
         else
         {
            _nativeObject = new SymbolItemPatternContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         info = new SymbolItemPatternInfoGeneric(_nativeObject.info);
         txtCount = FlashLabelArea.fromNative(_nativeObject.txtCount);
         txtNoPatterns = FlashLabelArea.fromNative(_nativeObject.txtNoPatterns);
         line1 = new SymbolItemPatternLineGeneric(_nativeObject.line1);
         line2 = new SymbolItemPatternLineGeneric(_nativeObject.line2);
         line3 = new SymbolItemPatternLineGeneric(_nativeObject.line3);
         line4 = new SymbolItemPatternLineGeneric(_nativeObject.line4);
         line5 = new SymbolItemPatternLineGeneric(_nativeObject.line5);
         line6 = new SymbolItemPatternLineGeneric(_nativeObject.line6);
         line7 = new SymbolItemPatternLineGeneric(_nativeObject.line7);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnFilter = new SymbolButtonGoalFilterGeneric(_nativeObject.btnFilter);
         itemPatternFilter = new SymbolItemPatternFilterGeneric(_nativeObject.itemPatternFilter);
      }
      
      public function setNativeInstance(param1:SymbolItemPatternContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
         FlashLabelArea.setNativeInstance(txtCount,_nativeObject.txtCount);
         FlashLabelArea.setNativeInstance(txtNoPatterns,_nativeObject.txtNoPatterns);
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.line6)
         {
            line6.setNativeInstance(_nativeObject.line6);
         }
         if(_nativeObject.line7)
         {
            line7.setNativeInstance(_nativeObject.line7);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnFilter)
         {
            btnFilter.setNativeInstance(_nativeObject.btnFilter);
         }
         if(_nativeObject.itemPatternFilter)
         {
            itemPatternFilter.setNativeInstance(_nativeObject.itemPatternFilter);
         }
      }
   }
}
