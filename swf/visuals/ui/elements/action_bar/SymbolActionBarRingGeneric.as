package visuals.ui.elements.action_bar
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   
   public class SymbolActionBarRingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolActionBarRing = null;
      
      public var action5:SymbolActionBarButtonGeneric = null;
      
      public var action3:SymbolActionBarButtonGeneric = null;
      
      public var action4:SymbolActionBarButtonGeneric = null;
      
      public var action6:SymbolActionBarButtonGeneric = null;
      
      public var action2:SymbolActionBarButtonGeneric = null;
      
      public var action1:SymbolActionBarButtonGeneric = null;
      
      public function SymbolActionBarRingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolActionBarRing;
         }
         else
         {
            _nativeObject = new SymbolActionBarRing();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         action5 = new SymbolActionBarButtonGeneric(_nativeObject.action5);
         action3 = new SymbolActionBarButtonGeneric(_nativeObject.action3);
         action4 = new SymbolActionBarButtonGeneric(_nativeObject.action4);
         action6 = new SymbolActionBarButtonGeneric(_nativeObject.action6);
         action2 = new SymbolActionBarButtonGeneric(_nativeObject.action2);
         action1 = new SymbolActionBarButtonGeneric(_nativeObject.action1);
      }
      
      public function setNativeInstance(param1:SymbolActionBarRing) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.action5)
         {
            action5.setNativeInstance(_nativeObject.action5);
         }
         if(_nativeObject.action3)
         {
            action3.setNativeInstance(_nativeObject.action3);
         }
         if(_nativeObject.action4)
         {
            action4.setNativeInstance(_nativeObject.action4);
         }
         if(_nativeObject.action6)
         {
            action6.setNativeInstance(_nativeObject.action6);
         }
         if(_nativeObject.action2)
         {
            action2.setNativeInstance(_nativeObject.action2);
         }
         if(_nativeObject.action1)
         {
            action1.setNativeInstance(_nativeObject.action1);
         }
      }
   }
}
