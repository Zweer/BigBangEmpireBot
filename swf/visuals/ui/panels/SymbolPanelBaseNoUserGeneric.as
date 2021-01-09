package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonAudioSettingsGeneric;
   import visuals.ui.elements.buttons.SymbolButtonForumGeneric;
   import visuals.ui.elements.buttons.SymbolButtonSupportGeneric;
   import visuals.ui.elements.icons.SymbolIconXGeneric;
   
   public class SymbolPanelBaseNoUserGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelBaseNoUser = null;
      
      public var btnSupport:SymbolButtonSupportGeneric = null;
      
      public var btnForum:SymbolButtonForumGeneric = null;
      
      public var btnSoundToggle:SymbolButtonAudioSettingsGeneric = null;
      
      public var iconSoundMuted:SymbolIconXGeneric = null;
      
      public function SymbolPanelBaseNoUserGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelBaseNoUser;
         }
         else
         {
            _nativeObject = new SymbolPanelBaseNoUser();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         btnSupport = new SymbolButtonSupportGeneric(_nativeObject.btnSupport);
         btnForum = new SymbolButtonForumGeneric(_nativeObject.btnForum);
         btnSoundToggle = new SymbolButtonAudioSettingsGeneric(_nativeObject.btnSoundToggle);
         iconSoundMuted = new SymbolIconXGeneric(_nativeObject.iconSoundMuted);
      }
      
      public function setNativeInstance(param1:SymbolPanelBaseNoUser) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.btnSupport)
         {
            btnSupport.setNativeInstance(_nativeObject.btnSupport);
         }
         if(_nativeObject.btnForum)
         {
            btnForum.setNativeInstance(_nativeObject.btnForum);
         }
         if(_nativeObject.btnSoundToggle)
         {
            btnSoundToggle.setNativeInstance(_nativeObject.btnSoundToggle);
         }
         if(_nativeObject.iconSoundMuted)
         {
            iconSoundMuted.setNativeInstance(_nativeObject.iconSoundMuted);
         }
      }
   }
}
