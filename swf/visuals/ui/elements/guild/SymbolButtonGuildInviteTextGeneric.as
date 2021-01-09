package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusGreenGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   
   public class SymbolButtonGuildInviteTextGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonGuildInviteText = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public var caption:ILabel = null;
      
      public var symbolIconGuild:SymbolIconGuildGeneric = null;
      
      public var symbolButtonPlusGreen:SymbolButtonPlusGreenGeneric = null;
      
      public function SymbolButtonGuildInviteTextGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonGuildInviteText;
         }
         else
         {
            _nativeObject = new SymbolButtonGuildInviteText();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
         caption = FlashLabel.fromNative(_nativeObject.caption);
         symbolIconGuild = new SymbolIconGuildGeneric(_nativeObject.symbolIconGuild);
         symbolButtonPlusGreen = new SymbolButtonPlusGreenGeneric(_nativeObject.symbolButtonPlusGreen);
      }
      
      public function setNativeInstance(param1:SymbolButtonGuildInviteText) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         FlashLabel.setNativeInstance(caption,_nativeObject.caption);
         if(_nativeObject.symbolIconGuild)
         {
            symbolIconGuild.setNativeInstance(_nativeObject.symbolIconGuild);
         }
         if(_nativeObject.symbolButtonPlusGreen)
         {
            symbolButtonPlusGreen.setNativeInstance(_nativeObject.symbolButtonPlusGreen);
         }
      }
   }
}
