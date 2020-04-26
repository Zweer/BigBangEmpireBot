package visuals.ui.elements.friendbar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   
   public class FriendbarSymbolApplicationGeneric extends Sprite
   {
       
      
      private var _nativeObject:FriendbarSymbolApplication = null;
      
      public var backgroundBlack:FriendbarSymbolFriendbarBackgroundGeneric = null;
      
      public var empty9:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty8:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty7:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty6:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty5:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty4:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty3:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty2:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty0:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty10:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var empty1:FriendbarSymbolFriendEmptyGeneric = null;
      
      public var friend9:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend8:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend7:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend6:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend5:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend4:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend3:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend2:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend10:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var friend1:FriendbarSymbolFriendPhotoGeneric = null;
      
      public var btnScrollRight:SymbolButtonArrowRightGeneric = null;
      
      public var btnScrollLeft:SymbolButtonArrowLeftGeneric = null;
      
      public var btnFilter:FriendbarSymbolButtonArrowDownGeneric = null;
      
      public var blockerLayer:FriendbarSymbolBlockerLayerGeneric = null;
      
      public var dialogLayer:FriendbarSymbolBlockerLayerGeneric = null;
      
      public var mouseLayer:FriendbarSymbolBlockerLayerGeneric = null;
      
      public var filter:FriendbarSymbolUiShowOnlineFriendsGeneric = null;
      
      public var toggleButton:SymbolFriendbarToggleButtonGeneric = null;
      
      public function FriendbarSymbolApplicationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as FriendbarSymbolApplication;
         }
         else
         {
            _nativeObject = new FriendbarSymbolApplication();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundBlack = new FriendbarSymbolFriendbarBackgroundGeneric(_nativeObject.backgroundBlack);
         empty9 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty9);
         empty8 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty8);
         empty7 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty7);
         empty6 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty6);
         empty5 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty5);
         empty4 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty4);
         empty3 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty3);
         empty2 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty2);
         empty0 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty0);
         empty10 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty10);
         empty1 = new FriendbarSymbolFriendEmptyGeneric(_nativeObject.empty1);
         friend9 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend9);
         friend8 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend8);
         friend7 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend7);
         friend6 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend6);
         friend5 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend5);
         friend4 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend4);
         friend3 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend3);
         friend2 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend2);
         friend10 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend10);
         friend1 = new FriendbarSymbolFriendPhotoGeneric(_nativeObject.friend1);
         btnScrollRight = new SymbolButtonArrowRightGeneric(_nativeObject.btnScrollRight);
         btnScrollLeft = new SymbolButtonArrowLeftGeneric(_nativeObject.btnScrollLeft);
         btnFilter = new FriendbarSymbolButtonArrowDownGeneric(_nativeObject.btnFilter);
         blockerLayer = new FriendbarSymbolBlockerLayerGeneric(_nativeObject.blockerLayer);
         dialogLayer = new FriendbarSymbolBlockerLayerGeneric(_nativeObject.dialogLayer);
         mouseLayer = new FriendbarSymbolBlockerLayerGeneric(_nativeObject.mouseLayer);
         filter = new FriendbarSymbolUiShowOnlineFriendsGeneric(_nativeObject.filter);
         toggleButton = new SymbolFriendbarToggleButtonGeneric(_nativeObject.toggleButton);
      }
      
      public function setNativeInstance(param1:FriendbarSymbolApplication) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundBlack)
         {
            backgroundBlack.setNativeInstance(_nativeObject.backgroundBlack);
         }
         if(_nativeObject.empty9)
         {
            empty9.setNativeInstance(_nativeObject.empty9);
         }
         if(_nativeObject.empty8)
         {
            empty8.setNativeInstance(_nativeObject.empty8);
         }
         if(_nativeObject.empty7)
         {
            empty7.setNativeInstance(_nativeObject.empty7);
         }
         if(_nativeObject.empty6)
         {
            empty6.setNativeInstance(_nativeObject.empty6);
         }
         if(_nativeObject.empty5)
         {
            empty5.setNativeInstance(_nativeObject.empty5);
         }
         if(_nativeObject.empty4)
         {
            empty4.setNativeInstance(_nativeObject.empty4);
         }
         if(_nativeObject.empty3)
         {
            empty3.setNativeInstance(_nativeObject.empty3);
         }
         if(_nativeObject.empty2)
         {
            empty2.setNativeInstance(_nativeObject.empty2);
         }
         if(_nativeObject.empty0)
         {
            empty0.setNativeInstance(_nativeObject.empty0);
         }
         if(_nativeObject.empty10)
         {
            empty10.setNativeInstance(_nativeObject.empty10);
         }
         if(_nativeObject.empty1)
         {
            empty1.setNativeInstance(_nativeObject.empty1);
         }
         if(_nativeObject.friend9)
         {
            friend9.setNativeInstance(_nativeObject.friend9);
         }
         if(_nativeObject.friend8)
         {
            friend8.setNativeInstance(_nativeObject.friend8);
         }
         if(_nativeObject.friend7)
         {
            friend7.setNativeInstance(_nativeObject.friend7);
         }
         if(_nativeObject.friend6)
         {
            friend6.setNativeInstance(_nativeObject.friend6);
         }
         if(_nativeObject.friend5)
         {
            friend5.setNativeInstance(_nativeObject.friend5);
         }
         if(_nativeObject.friend4)
         {
            friend4.setNativeInstance(_nativeObject.friend4);
         }
         if(_nativeObject.friend3)
         {
            friend3.setNativeInstance(_nativeObject.friend3);
         }
         if(_nativeObject.friend2)
         {
            friend2.setNativeInstance(_nativeObject.friend2);
         }
         if(_nativeObject.friend10)
         {
            friend10.setNativeInstance(_nativeObject.friend10);
         }
         if(_nativeObject.friend1)
         {
            friend1.setNativeInstance(_nativeObject.friend1);
         }
         if(_nativeObject.btnScrollRight)
         {
            btnScrollRight.setNativeInstance(_nativeObject.btnScrollRight);
         }
         if(_nativeObject.btnScrollLeft)
         {
            btnScrollLeft.setNativeInstance(_nativeObject.btnScrollLeft);
         }
         if(_nativeObject.btnFilter)
         {
            btnFilter.setNativeInstance(_nativeObject.btnFilter);
         }
         if(_nativeObject.blockerLayer)
         {
            blockerLayer.setNativeInstance(_nativeObject.blockerLayer);
         }
         if(_nativeObject.dialogLayer)
         {
            dialogLayer.setNativeInstance(_nativeObject.dialogLayer);
         }
         if(_nativeObject.mouseLayer)
         {
            mouseLayer.setNativeInstance(_nativeObject.mouseLayer);
         }
         if(_nativeObject.filter)
         {
            filter.setNativeInstance(_nativeObject.filter);
         }
         if(_nativeObject.toggleButton)
         {
            toggleButton.setNativeInstance(_nativeObject.toggleButton);
         }
      }
   }
}
