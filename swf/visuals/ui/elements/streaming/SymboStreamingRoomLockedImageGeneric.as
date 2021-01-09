package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymboStreamingRoomLockedImageGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymboStreamingRoomLockedImage = null;
      
      public var room3:SymbolIconStreamingRoom3LockedGeneric = null;
      
      public var room4:SymbolIconStreamingRoom4LockedGeneric = null;
      
      public var room5:SymbolIconStreamingRoom5LockedGeneric = null;
      
      public var room6:SymbolIconStreamingRoom6LockedGeneric = null;
      
      public function SymboStreamingRoomLockedImageGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymboStreamingRoomLockedImage;
         }
         else
         {
            _nativeObject = new SymboStreamingRoomLockedImage();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         room3 = new SymbolIconStreamingRoom3LockedGeneric(_nativeObject.room3);
         room4 = new SymbolIconStreamingRoom4LockedGeneric(_nativeObject.room4);
         room5 = new SymbolIconStreamingRoom5LockedGeneric(_nativeObject.room5);
         room6 = new SymbolIconStreamingRoom6LockedGeneric(_nativeObject.room6);
      }
      
      public function setNativeInstance(param1:SymboStreamingRoomLockedImage) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.room3)
         {
            room3.setNativeInstance(_nativeObject.room3);
         }
         if(_nativeObject.room4)
         {
            room4.setNativeInstance(_nativeObject.room4);
         }
         if(_nativeObject.room5)
         {
            room5.setNativeInstance(_nativeObject.room5);
         }
         if(_nativeObject.room6)
         {
            room6.setNativeInstance(_nativeObject.room6);
         }
      }
   }
}
