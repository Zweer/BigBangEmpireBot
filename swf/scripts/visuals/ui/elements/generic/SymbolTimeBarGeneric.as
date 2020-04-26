package visuals.ui.elements.generic
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.quest.SymbolTimebarMaskGeneric;
   
   public class SymbolTimeBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolTimeBar = null;
      
      public var background:SymbolTimeBarBackgroundGeneric = null;
      
      public var fill:SymbolTimeBarFillGeneric = null;
      
      public var m:SymbolTimebarMaskGeneric = null;
      
      public var front:SymbolTimeBarFrontGeneric = null;
      
      public function SymbolTimeBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolTimeBar;
         }
         else
         {
            _nativeObject = new SymbolTimeBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         background = new SymbolTimeBarBackgroundGeneric(_nativeObject.background);
         fill = new SymbolTimeBarFillGeneric(_nativeObject.fill);
         m = new SymbolTimebarMaskGeneric(_nativeObject.m);
         front = new SymbolTimeBarFrontGeneric(_nativeObject.front);
      }
      
      public function setNativeInstance(param1:SymbolTimeBar) : void
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
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         if(_nativeObject.front)
         {
            front.setNativeInstance(_nativeObject.front);
         }
      }
   }
}
