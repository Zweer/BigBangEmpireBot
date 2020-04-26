package visuals.ui.elements.quest
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolButtonDungeonStatusGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonDungeonStatus = null;
      
      public var txtWinsRemaining:ILabelArea = null;
      
      public function SymbolButtonDungeonStatusGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonDungeonStatus;
         }
         else
         {
            _nativeObject = new SymbolButtonDungeonStatus();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtWinsRemaining = FlashLabelArea.fromNative(_nativeObject.txtWinsRemaining);
      }
      
      public function setNativeInstance(param1:SymbolButtonDungeonStatus) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabelArea.setNativeInstance(txtWinsRemaining,_nativeObject.txtWinsRemaining);
      }
   }
}
