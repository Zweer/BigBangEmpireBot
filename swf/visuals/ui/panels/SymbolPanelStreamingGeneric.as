package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.streaming.SymbolStreamingActorButtonGeneric;
   import visuals.ui.elements.streaming.SymbolStreamingBackgroundGeneric;
   import visuals.ui.elements.streaming.SymbolStreamingForegroundGeneric;
   import visuals.ui.elements.streaming.SymbolStreamingResourcePanelGeneric;
   import visuals.ui.elements.streaming.SymbolStreamingRoomGeneric;
   
   public class SymbolPanelStreamingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelStreaming = null;
      
      public var bg:SymbolStreamingBackgroundGeneric = null;
      
      public var room1:SymbolStreamingRoomGeneric = null;
      
      public var room2:SymbolStreamingRoomGeneric = null;
      
      public var room3:SymbolStreamingRoomGeneric = null;
      
      public var room4:SymbolStreamingRoomGeneric = null;
      
      public var room5:SymbolStreamingRoomGeneric = null;
      
      public var room6:SymbolStreamingRoomGeneric = null;
      
      public var fg:SymbolStreamingForegroundGeneric = null;
      
      public var btnActors:SymbolStreamingActorButtonGeneric = null;
      
      public var resourcePanel:SymbolStreamingResourcePanelGeneric = null;
      
      public function SymbolPanelStreamingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelStreaming;
         }
         else
         {
            _nativeObject = new SymbolPanelStreaming();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolStreamingBackgroundGeneric(_nativeObject.bg);
         room1 = new SymbolStreamingRoomGeneric(_nativeObject.room1);
         room2 = new SymbolStreamingRoomGeneric(_nativeObject.room2);
         room3 = new SymbolStreamingRoomGeneric(_nativeObject.room3);
         room4 = new SymbolStreamingRoomGeneric(_nativeObject.room4);
         room5 = new SymbolStreamingRoomGeneric(_nativeObject.room5);
         room6 = new SymbolStreamingRoomGeneric(_nativeObject.room6);
         fg = new SymbolStreamingForegroundGeneric(_nativeObject.fg);
         btnActors = new SymbolStreamingActorButtonGeneric(_nativeObject.btnActors);
         resourcePanel = new SymbolStreamingResourcePanelGeneric(_nativeObject.resourcePanel);
      }
      
      public function setNativeInstance(param1:SymbolPanelStreaming) : void
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
         if(_nativeObject.room1)
         {
            room1.setNativeInstance(_nativeObject.room1);
         }
         if(_nativeObject.room2)
         {
            room2.setNativeInstance(_nativeObject.room2);
         }
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
         if(_nativeObject.fg)
         {
            fg.setNativeInstance(_nativeObject.fg);
         }
         if(_nativeObject.btnActors)
         {
            btnActors.setNativeInstance(_nativeObject.btnActors);
         }
         if(_nativeObject.resourcePanel)
         {
            resourcePanel.setNativeInstance(_nativeObject.resourcePanel);
         }
      }
   }
}
