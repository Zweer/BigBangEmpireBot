package visuals.ui.elements.streaming
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolStreamingActorContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStreamingActorContent = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var image:SymbolPlaceholderGeneric = null;
      
      public var txtName:ILabel = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var pose1:SymbolStreamingActorAnimationGeneric = null;
      
      public var pose2:SymbolStreamingActorAnimationGeneric = null;
      
      public var pose3:SymbolStreamingActorAnimationGeneric = null;
      
      public function SymbolStreamingActorContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStreamingActorContent;
         }
         else
         {
            _nativeObject = new SymbolStreamingActorContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         image = new SymbolPlaceholderGeneric(_nativeObject.image);
         txtName = FlashLabel.fromNative(_nativeObject.txtName);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         pose1 = new SymbolStreamingActorAnimationGeneric(_nativeObject.pose1);
         pose2 = new SymbolStreamingActorAnimationGeneric(_nativeObject.pose2);
         pose3 = new SymbolStreamingActorAnimationGeneric(_nativeObject.pose3);
      }
      
      public function setNativeInstance(param1:SymbolStreamingActorContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.image)
         {
            image.setNativeInstance(_nativeObject.image);
         }
         FlashLabel.setNativeInstance(txtName,_nativeObject.txtName);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.pose1)
         {
            pose1.setNativeInstance(_nativeObject.pose1);
         }
         if(_nativeObject.pose2)
         {
            pose2.setNativeInstance(_nativeObject.pose2);
         }
         if(_nativeObject.pose3)
         {
            pose3.setNativeInstance(_nativeObject.pose3);
         }
      }
   }
}
