package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolAvatarContainerGeneric;
   
   public class SymbolDuelAvatarsGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolDuelAvatars = null;
      
      public var avatar1:SymbolAvatarContainerGeneric = null;
      
      public var avatar3:SymbolAvatarContainerGeneric = null;
      
      public var avatar4:SymbolAvatarContainerGeneric = null;
      
      public var avatar6:SymbolAvatarContainerGeneric = null;
      
      public var avatar8:SymbolAvatarContainerGeneric = null;
      
      public var avatar2:SymbolAvatarContainerGeneric = null;
      
      public var avatar5:SymbolAvatarContainerGeneric = null;
      
      public var avatar7:SymbolAvatarContainerGeneric = null;
      
      public var avatar9:SymbolAvatarContainerGeneric = null;
      
      public function SymbolDuelAvatarsGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolDuelAvatars;
         }
         else
         {
            _nativeObject = new SymbolDuelAvatars();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar1 = new SymbolAvatarContainerGeneric(_nativeObject.avatar1);
         avatar3 = new SymbolAvatarContainerGeneric(_nativeObject.avatar3);
         avatar4 = new SymbolAvatarContainerGeneric(_nativeObject.avatar4);
         avatar6 = new SymbolAvatarContainerGeneric(_nativeObject.avatar6);
         avatar8 = new SymbolAvatarContainerGeneric(_nativeObject.avatar8);
         avatar2 = new SymbolAvatarContainerGeneric(_nativeObject.avatar2);
         avatar5 = new SymbolAvatarContainerGeneric(_nativeObject.avatar5);
         avatar7 = new SymbolAvatarContainerGeneric(_nativeObject.avatar7);
         avatar9 = new SymbolAvatarContainerGeneric(_nativeObject.avatar9);
      }
      
      public function setNativeInstance(param1:SymbolDuelAvatars) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.avatar1)
         {
            avatar1.setNativeInstance(_nativeObject.avatar1);
         }
         if(_nativeObject.avatar3)
         {
            avatar3.setNativeInstance(_nativeObject.avatar3);
         }
         if(_nativeObject.avatar4)
         {
            avatar4.setNativeInstance(_nativeObject.avatar4);
         }
         if(_nativeObject.avatar6)
         {
            avatar6.setNativeInstance(_nativeObject.avatar6);
         }
         if(_nativeObject.avatar8)
         {
            avatar8.setNativeInstance(_nativeObject.avatar8);
         }
         if(_nativeObject.avatar2)
         {
            avatar2.setNativeInstance(_nativeObject.avatar2);
         }
         if(_nativeObject.avatar5)
         {
            avatar5.setNativeInstance(_nativeObject.avatar5);
         }
         if(_nativeObject.avatar7)
         {
            avatar7.setNativeInstance(_nativeObject.avatar7);
         }
         if(_nativeObject.avatar9)
         {
            avatar9.setNativeInstance(_nativeObject.avatar9);
         }
      }
   }
}
