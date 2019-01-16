package visuals.ui.elements.optical_changes
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSmallTabGeneric;
   
   public class SymbolOpticalChangesContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolOpticalChangesContent = null;
      
      public var line1:SymbolOpticalChangesLineGeneric = null;
      
      public var line2:SymbolOpticalChangesLineGeneric = null;
      
      public var line3:SymbolOpticalChangesLineGeneric = null;
      
      public var line4:SymbolOpticalChangesLineGeneric = null;
      
      public var line5:SymbolOpticalChangesLineGeneric = null;
      
      public var line6:SymbolOpticalChangesLineGeneric = null;
      
      public var line7:SymbolOpticalChangesLineGeneric = null;
      
      public var txtCount:ILabelArea = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnTabDeco:SymbolButtonSmallTabGeneric = null;
      
      public var btnTabCharacter:SymbolButtonSmallTabGeneric = null;
      
      public var info:SymbolOpticalChangesInfoGeneric = null;
      
      public function SymbolOpticalChangesContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolOpticalChangesContent;
         }
         else
         {
            _nativeObject = new SymbolOpticalChangesContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolOpticalChangesLineGeneric(_nativeObject.line1);
         line2 = new SymbolOpticalChangesLineGeneric(_nativeObject.line2);
         line3 = new SymbolOpticalChangesLineGeneric(_nativeObject.line3);
         line4 = new SymbolOpticalChangesLineGeneric(_nativeObject.line4);
         line5 = new SymbolOpticalChangesLineGeneric(_nativeObject.line5);
         line6 = new SymbolOpticalChangesLineGeneric(_nativeObject.line6);
         line7 = new SymbolOpticalChangesLineGeneric(_nativeObject.line7);
         txtCount = FlashLabelArea.fromNative(_nativeObject.txtCount);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         btnTabDeco = new SymbolButtonSmallTabGeneric(_nativeObject.btnTabDeco);
         btnTabCharacter = new SymbolButtonSmallTabGeneric(_nativeObject.btnTabCharacter);
         info = new SymbolOpticalChangesInfoGeneric(_nativeObject.info);
      }
      
      public function setNativeInstance(param1:SymbolOpticalChangesContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
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
         FlashLabelArea.setNativeInstance(txtCount,_nativeObject.txtCount);
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.btnTabDeco)
         {
            btnTabDeco.setNativeInstance(_nativeObject.btnTabDeco);
         }
         if(_nativeObject.btnTabCharacter)
         {
            btnTabCharacter.setNativeInstance(_nativeObject.btnTabCharacter);
         }
         if(_nativeObject.info)
         {
            info.setNativeInstance(_nativeObject.info);
         }
      }
   }
}
