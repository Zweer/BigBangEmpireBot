package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.herobook.SymbolHerobookTimerGeneric;
   
   public class SymbolButtonConventionMultitaskingGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonConventionMultitasking = null;
      
      public var timer:SymbolHerobookTimerGeneric = null;
      
      public var graphic:SymbolConventionGraphicGeneric = null;
      
      public function SymbolButtonConventionMultitaskingGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonConventionMultitasking;
         }
         else
         {
            _nativeObject = new SymbolButtonConventionMultitasking();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         timer = new SymbolHerobookTimerGeneric(_nativeObject.timer);
         graphic = new SymbolConventionGraphicGeneric(_nativeObject.graphic);
      }
      
      public function setNativeInstance(param1:SymbolButtonConventionMultitasking) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.timer)
         {
            timer.setNativeInstance(_nativeObject.timer);
         }
         if(_nativeObject.graphic)
         {
            graphic.setNativeInstance(_nativeObject.graphic);
         }
      }
   }
}
