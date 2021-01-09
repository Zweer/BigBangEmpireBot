package com.playata.application.ui.elements.avatar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.character.AppearanceSettings;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   
   public class UiAvatarLayeredVisual implements IAvatarVisual
   {
       
      
      private var _avatar:SymbolAvatarGeneric = null;
      
      private var _visualAvatar:Avatar = null;
      
      private var _behindAvatarAnimation:Sprite = null;
      
      private var _infrontAvatarAnimation:Sprite = null;
      
      private var _avatarAnimation:AvatarAnimation = null;
      
      public function UiAvatarLayeredVisual(param1:SymbolAvatarGeneric, param2:Boolean = false, param3:Boolean = false)
      {
         super();
         _avatar = param1;
         _avatar.avatarContainer.removeAllChildren();
         _behindAvatarAnimation = new Sprite();
         _infrontAvatarAnimation = new Sprite();
         _avatarAnimation = new AvatarAnimation(_behindAvatarAnimation,_infrontAvatarAnimation);
         _visualAvatar = new Avatar(param2,param3,AppEnvironment.appPlatform.isHidePantiesAllowed,AppEnvironment.appPlatform.isHideBraAllowed);
         _avatar.avatarContainer.addChild(_behindAvatarAnimation);
         _avatar.avatarContainer.addChild(FlashSprite.fromNative(_visualAvatar));
         _avatar.avatarContainer.addChild(_infrontAvatarAnimation);
         _behindAvatarAnimation.scale = 0.5;
         _infrontAvatarAnimation.scale = 0.5;
      }
      
      public function dispose() : void
      {
         _avatarAnimation.dispose();
         _visualAvatar.dispose();
         _avatarAnimation = null;
         _visualAvatar = null;
      }
      
      public function update(param1:AppearanceSettings) : void
      {
         _visualAvatar.update(param1);
         _avatarAnimation.update(param1);
      }
      
      public function set measurePerformance(param1:Boolean) : void
      {
         _visualAvatar.measurePerformance = param1;
      }
      
      public function get averageRenderTime() : Number
      {
         return _visualAvatar.averageRenderTime;
      }
      
      public function startAnimation() : void
      {
         _visualAvatar.playing = true;
         _avatarAnimation.startAnimation();
      }
      
      public function stopAnimation() : void
      {
         _visualAvatar.playing = false;
         _avatarAnimation.stopAnimation();
      }
   }
}
