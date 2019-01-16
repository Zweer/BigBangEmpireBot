package visuals.ui.elements.friendbar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.backgrounds.SymbolSlice9BackgroundTooltipGeneric;
   
   public class FriendbarSymbolUiShowOnlineFriendsGeneric extends Sprite
   {
       
      
      private var _nativeObject:FriendbarSymbolUiShowOnlineFriends = null;
      
      public var background:SymbolSlice9BackgroundTooltipGeneric = null;
      
      public var checkOnlinePlayer:SymbolUiCheckboxGeneric = null;
      
      public var checkGuildMember:SymbolUiCheckboxGeneric = null;
      
      public var txtOnlinePlayer:ILabel = null;
      
      public var txtGuildMember:ILabel = null;
      
      public function FriendbarSymbolUiShowOnlineFriendsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as FriendbarSymbolUiShowOnlineFriends;
         }
         else
         {
            _nativeObject = new FriendbarSymbolUiShowOnlineFriends();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolSlice9BackgroundTooltipGeneric(_nativeObject.background);
         checkOnlinePlayer = new SymbolUiCheckboxGeneric(_nativeObject.checkOnlinePlayer);
         checkGuildMember = new SymbolUiCheckboxGeneric(_nativeObject.checkGuildMember);
         txtOnlinePlayer = FlashLabel.fromNative(_nativeObject.txtOnlinePlayer);
         txtGuildMember = FlashLabel.fromNative(_nativeObject.txtGuildMember);
      }
      
      public function setNativeInstance(param1:FriendbarSymbolUiShowOnlineFriends) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.background)
         {
            background.setNativeInstance(_nativeObject.background);
         }
         if(_nativeObject.checkOnlinePlayer)
         {
            checkOnlinePlayer.setNativeInstance(_nativeObject.checkOnlinePlayer);
         }
         if(_nativeObject.checkGuildMember)
         {
            checkGuildMember.setNativeInstance(_nativeObject.checkGuildMember);
         }
         FlashLabel.setNativeInstance(txtOnlinePlayer,_nativeObject.txtOnlinePlayer);
         FlashLabel.setNativeInstance(txtGuildMember,_nativeObject.txtGuildMember);
      }
   }
}
