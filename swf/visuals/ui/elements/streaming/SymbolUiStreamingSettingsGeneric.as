package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolUiStreamingSettingsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolUiStreamingSettings = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var line1:SymbolStreamingSettingLineGeneric = null;
      
      public var line2:SymbolStreamingSettingLineGeneric = null;
      
      public var line3:SymbolStreamingSettingLineGeneric = null;
      
      public var line4:SymbolStreamingSettingLineGeneric = null;
      
      public var line5:SymbolStreamingSettingLineGeneric = null;
      
      public var line6:SymbolStreamingSettingLineGeneric = null;
      
      public var content:SymbolStreamingSettingContentGeneric = null;
      
      public function SymbolUiStreamingSettingsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolUiStreamingSettings;
         }
         else
         {
            _nativeObject = new SymbolUiStreamingSettings();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         line1 = new SymbolStreamingSettingLineGeneric(_nativeObject.line1);
         line2 = new SymbolStreamingSettingLineGeneric(_nativeObject.line2);
         line3 = new SymbolStreamingSettingLineGeneric(_nativeObject.line3);
         line4 = new SymbolStreamingSettingLineGeneric(_nativeObject.line4);
         line5 = new SymbolStreamingSettingLineGeneric(_nativeObject.line5);
         line6 = new SymbolStreamingSettingLineGeneric(_nativeObject.line6);
         content = new SymbolStreamingSettingContentGeneric(_nativeObject.content);
      }
      
      public function setNativeInstance(param1:SymbolUiStreamingSettings) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
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
         if(_nativeObject.content)
         {
            content.setNativeInstance(_nativeObject.content);
         }
      }
   }
}
