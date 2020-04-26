package visuals.ui.base
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundButtonGeneric;
   
   public class SymbolIconButtonWhisperGuildMemberGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolIconButtonWhisperGuildMember = null;
      
      public var bg:SymbolSlice9BackgroundButtonGeneric = null;
      
      public function SymbolIconButtonWhisperGuildMemberGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolIconButtonWhisperGuildMember;
         }
         else
         {
            _nativeObject = new SymbolIconButtonWhisperGuildMember();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolSlice9BackgroundButtonGeneric(_nativeObject.bg);
      }
      
      public function setNativeInstance(param1:SymbolIconButtonWhisperGuildMember) : void
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
      }
   }
}
