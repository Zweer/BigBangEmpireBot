package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolIgnoredCharacterListGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIgnoredCharacterList = null;
      
      public var line1:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line2:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line3:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line4:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line5:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line6:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line7:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line8:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line9:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line10:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line11:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line12:SymbolIgnoredCharacterLineGeneric = null;
      
      public var line13:SymbolIgnoredCharacterLineGeneric = null;
      
      public var txtNoIgnores:ILabelArea = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public function SymbolIgnoredCharacterListGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIgnoredCharacterList;
         }
         else
         {
            _nativeObject = new SymbolIgnoredCharacterList();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line1);
         line2 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line2);
         line3 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line3);
         line4 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line4);
         line5 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line5);
         line6 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line6);
         line7 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line7);
         line8 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line8);
         line9 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line9);
         line10 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line10);
         line11 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line11);
         line12 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line12);
         line13 = new SymbolIgnoredCharacterLineGeneric(_nativeObject.line13);
         txtNoIgnores = FlashLabelArea.fromNative(_nativeObject.txtNoIgnores);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
      }
      
      public function setNativeInstance(param1:SymbolIgnoredCharacterList) : void
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
         if(_nativeObject.line8)
         {
            line8.setNativeInstance(_nativeObject.line8);
         }
         if(_nativeObject.line9)
         {
            line9.setNativeInstance(_nativeObject.line9);
         }
         if(_nativeObject.line10)
         {
            line10.setNativeInstance(_nativeObject.line10);
         }
         if(_nativeObject.line11)
         {
            line11.setNativeInstance(_nativeObject.line11);
         }
         if(_nativeObject.line12)
         {
            line12.setNativeInstance(_nativeObject.line12);
         }
         if(_nativeObject.line13)
         {
            line13.setNativeInstance(_nativeObject.line13);
         }
         FlashLabelArea.setNativeInstance(txtNoIgnores,_nativeObject.txtNoIgnores);
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
      }
   }
}
