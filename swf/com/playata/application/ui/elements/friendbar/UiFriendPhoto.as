package com.playata.application.ui.elements.friendbar
{
   import com.playata.application.AppEnvironment;
   import com.playata.application.data.friendbar.FriendBarFriend;
   import com.playata.application.ui.effects.ScaleInOutEffect;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.util.NumberUtil;
   import com.playata.framework.display.IImage;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.friendbar.FriendbarSymbolFriendPhotoGeneric;
   
   public class UiFriendPhoto
   {
       
      
      private var _content:FriendbarSymbolFriendPhotoGeneric = null;
      
      private var _friend:FriendBarFriend = null;
      
      private var _mouseLayer:InteractiveDisplayObject = null;
      
      private var _blockerEffect:ScaleInOutEffect = null;
      
      public function UiFriendPhoto(param1:FriendbarSymbolFriendPhotoGeneric)
      {
         super();
         _content = param1;
         _content.rotation = NumberUtil.randomNumber(-5,5);
         _mouseLayer = new InteractiveDisplayObject(_content.mouseLayer);
         _mouseLayer.onClick.add(handleClick);
         _blockerEffect = new ScaleInOutEffect(_content.loading,0.5,1.2);
         _content.characterImage.x = _content.characterImage.x - 45;
         _content.characterImage.y = _content.characterImage.y - 45;
         _content.txtLevel.x = _content.txtLevel.x + 4;
         refresh(null);
      }
      
      public function dispose() : void
      {
         _mouseLayer.dispose();
         _blockerEffect.dispose();
         _blockerEffect = null;
      }
      
      public function get friend() : FriendBarFriend
      {
         return _friend;
      }
      
      public function refresh(param1:FriendBarFriend) : void
      {
         _friend = param1;
         _content.visible = _friend != null;
         if(!_friend)
         {
            return;
         }
         _content.txtLevel.text = _friend.characterLevel.toString();
         _content.txtLevel.autoFontSize = true;
         _content.iconOnline.visible = _friend.isCharacterOnline;
         _content.txtCharacterName.text = _friend.characterName;
         _content.txtCharacterName.textColor = !!_friend.isGuildMember?16711908:14342874;
         _content.txtPlatformName.visible = false;
         _content.platformImage.visible = false;
         refreshImage(_friend.characterImage);
      }
      
      public function refreshImage(param1:IImage) : void
      {
         if(!_friend)
         {
            return;
         }
         var _loc2_:Boolean = _content.loading.visible;
         _content.loading.visible = param1 == null;
         if(_content.loading.visible)
         {
            _blockerEffect.play();
         }
         else
         {
            _blockerEffect.stop();
         }
         _content.characterImage.removeAllChildren();
         if(param1)
         {
            if(_loc2_)
            {
               param1.alpha = 1;
               param1.tweenFrom(0.5,{"alpha":0});
            }
            _content.characterImage.addChild(param1);
         }
         else
         {
            _friend.requestImage();
         }
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         Environment.audio.playFX("ui_button_click.mp3");
         AppEnvironment.friendBar.loadCharacter(_friend.characterId);
      }
      
      public function set visible(param1:Boolean) : void
      {
         _content.visible = param1;
      }
      
      public function get visible() : Boolean
      {
         return _content.visible;
      }
   }
}
