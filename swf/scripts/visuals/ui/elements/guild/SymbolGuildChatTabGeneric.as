package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.lib.flash.FlashTextInput;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.ITextInput;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiGuildChatLinkTooltipGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.emoticos.SymbolGuildChatEmoticonButtonGeneric;
   import visuals.ui.elements.emoticos.SymbolGuildChatEmoticonPickerGeneric;
   import visuals.ui.elements.generic.SymbolScrollKnobGeneric;
   import visuals.ui.elements.generic.SymbolScrollLineGeneric;
   import visuals.ui.elements.mail.SymbolButtonSendMessageGeneric;
   
   public class SymbolGuildChatTabGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildChatTab = null;
      
      public var bgCollapsed:SymbolGuildBottomFrameCollapsedGeneric = null;
      
      public var bgExpanded:SymbolGuildBottomFrameExpandedGeneric = null;
      
      public var txtOutput:ILabelArea = null;
      
      public var scrollLine:SymbolScrollLineGeneric = null;
      
      public var scrollKnob:SymbolScrollKnobGeneric = null;
      
      public var inputMessage:ITextInput = null;
      
      public var txtPrefix:ILabel = null;
      
      public var btnScrollDown:SymbolButtonArrowDownGeneric = null;
      
      public var btnEmoticon:SymbolGuildChatEmoticonButtonGeneric = null;
      
      public var emoticonPicker:SymbolGuildChatEmoticonPickerGeneric = null;
      
      public var btnSend:SymbolButtonSendMessageGeneric = null;
      
      public var linkTooltip:SymbolUiGuildChatLinkTooltipGeneric = null;
      
      public function SymbolGuildChatTabGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildChatTab;
         }
         else
         {
            _nativeObject = new SymbolGuildChatTab();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bgCollapsed = new SymbolGuildBottomFrameCollapsedGeneric(_nativeObject.bgCollapsed);
         bgExpanded = new SymbolGuildBottomFrameExpandedGeneric(_nativeObject.bgExpanded);
         txtOutput = FlashLabelArea.fromNative(_nativeObject.txtOutput);
         scrollLine = new SymbolScrollLineGeneric(_nativeObject.scrollLine);
         scrollKnob = new SymbolScrollKnobGeneric(_nativeObject.scrollKnob);
         inputMessage = FlashTextInput.fromNative(_nativeObject.inputMessage);
         txtPrefix = FlashLabel.fromNative(_nativeObject.txtPrefix);
         btnScrollDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnScrollDown);
         btnEmoticon = new SymbolGuildChatEmoticonButtonGeneric(_nativeObject.btnEmoticon);
         emoticonPicker = new SymbolGuildChatEmoticonPickerGeneric(_nativeObject.emoticonPicker);
         btnSend = new SymbolButtonSendMessageGeneric(_nativeObject.btnSend);
         linkTooltip = new SymbolUiGuildChatLinkTooltipGeneric(_nativeObject.linkTooltip);
      }
      
      public function setNativeInstance(param1:SymbolGuildChatTab) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bgCollapsed)
         {
            bgCollapsed.setNativeInstance(_nativeObject.bgCollapsed);
         }
         if(_nativeObject.bgExpanded)
         {
            bgExpanded.setNativeInstance(_nativeObject.bgExpanded);
         }
         FlashLabelArea.setNativeInstance(txtOutput,_nativeObject.txtOutput);
         if(_nativeObject.scrollLine)
         {
            scrollLine.setNativeInstance(_nativeObject.scrollLine);
         }
         if(_nativeObject.scrollKnob)
         {
            scrollKnob.setNativeInstance(_nativeObject.scrollKnob);
         }
         FlashTextInput.setNativeInstance(inputMessage,_nativeObject.inputMessage);
         FlashLabel.setNativeInstance(txtPrefix,_nativeObject.txtPrefix);
         if(_nativeObject.btnScrollDown)
         {
            btnScrollDown.setNativeInstance(_nativeObject.btnScrollDown);
         }
         if(_nativeObject.btnEmoticon)
         {
            btnEmoticon.setNativeInstance(_nativeObject.btnEmoticon);
         }
         if(_nativeObject.emoticonPicker)
         {
            emoticonPicker.setNativeInstance(_nativeObject.emoticonPicker);
         }
         if(_nativeObject.btnSend)
         {
            btnSend.setNativeInstance(_nativeObject.btnSend);
         }
         if(_nativeObject.linkTooltip)
         {
            linkTooltip.setNativeInstance(_nativeObject.linkTooltip);
         }
      }
   }
}
