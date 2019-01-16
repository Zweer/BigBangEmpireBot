package visuals.ui.elements.fan_foto
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolGenericListLineEvenGeneric;
   import visuals.ui.elements.generic.SymbolGenericListLineOddGeneric;
   import visuals.ui.elements.goal.SymbolGoalHighlightGeneric;
   import visuals.ui.elements.icons.SymbolIconCheckmarkGeneric;
   
   public class SymbolFanFotoPicturesLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolFanFotoPicturesLine = null;
      
      public var backgroundHighlight:SymbolGenericListLineOddGeneric = null;
      
      public var backgroundEven:SymbolGenericListLineEvenGeneric = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var txtName:ILabelArea = null;
      
      public var iconTag:SymbolIconFanFotoTagGeneric = null;
      
      public var iconTagInactive:SymbolIconFanFotoTagInactiveGeneric = null;
      
      public var iconAllTags:SymbolIconFanFotoAllTagsGeneric = null;
      
      public var iconCheckmark:SymbolIconCheckmarkGeneric = null;
      
      public function SymbolFanFotoPicturesLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolFanFotoPicturesLine;
         }
         else
         {
            _nativeObject = new SymbolFanFotoPicturesLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundHighlight = new SymbolGenericListLineOddGeneric(_nativeObject.backgroundHighlight);
         backgroundEven = new SymbolGenericListLineEvenGeneric(_nativeObject.backgroundEven);
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         txtName = FlashLabelArea.fromNative(_nativeObject.txtName);
         iconTag = new SymbolIconFanFotoTagGeneric(_nativeObject.iconTag);
         iconTagInactive = new SymbolIconFanFotoTagInactiveGeneric(_nativeObject.iconTagInactive);
         iconAllTags = new SymbolIconFanFotoAllTagsGeneric(_nativeObject.iconAllTags);
         iconCheckmark = new SymbolIconCheckmarkGeneric(_nativeObject.iconCheckmark);
      }
      
      public function setNativeInstance(param1:SymbolFanFotoPicturesLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundHighlight)
         {
            backgroundHighlight.setNativeInstance(_nativeObject.backgroundHighlight);
         }
         if(_nativeObject.backgroundEven)
         {
            backgroundEven.setNativeInstance(_nativeObject.backgroundEven);
         }
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         FlashLabelArea.setNativeInstance(txtName,_nativeObject.txtName);
         if(_nativeObject.iconTag)
         {
            iconTag.setNativeInstance(_nativeObject.iconTag);
         }
         if(_nativeObject.iconTagInactive)
         {
            iconTagInactive.setNativeInstance(_nativeObject.iconTagInactive);
         }
         if(_nativeObject.iconAllTags)
         {
            iconAllTags.setNativeInstance(_nativeObject.iconAllTags);
         }
         if(_nativeObject.iconCheckmark)
         {
            iconCheckmark.setNativeInstance(_nativeObject.iconCheckmark);
         }
      }
   }
}
