package visuals.ui.elements.friendbar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class FriendbarSymbolFriendEmptyGeneric extends Sprite
   {
       
      
      private var _nativeObject:FriendbarSymbolFriendEmpty = null;
      
      public var plus:FriendbarSymbolPlusGeneric = null;
      
      public var txtAddFriend:ILabelArea = null;
      
      public var mouseLayer:FriendbarSymbolMouseLayerGeneric = null;
      
      public function FriendbarSymbolFriendEmptyGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as FriendbarSymbolFriendEmpty;
         }
         else
         {
            _nativeObject = new FriendbarSymbolFriendEmpty();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         plus = new FriendbarSymbolPlusGeneric(_nativeObject.plus);
         txtAddFriend = FlashLabelArea.fromNative(_nativeObject.txtAddFriend);
         mouseLayer = new FriendbarSymbolMouseLayerGeneric(_nativeObject.mouseLayer);
      }
      
      public function setNativeInstance(param1:FriendbarSymbolFriendEmpty) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.plus)
         {
            plus.setNativeInstance(_nativeObject.plus);
         }
         FlashLabelArea.setNativeInstance(txtAddFriend,_nativeObject.txtAddFriend);
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
      }
   }
}
