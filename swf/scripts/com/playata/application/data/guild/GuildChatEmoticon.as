package com.playata.application.data.guild
{
   import com.playata.application.data.constants.CEmoticon;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.core.util.StringUtil;
   
   public class GuildChatEmoticon
   {
      
      private static var _allEmoticons:Vector.<GuildChatEmoticon> = null;
       
      
      private var _identifier:String = null;
      
      private var _codes:Vector.<String> = null;
      
      public function GuildChatEmoticon(param1:String)
      {
         super();
         _identifier = param1;
      }
      
      public static function getAllEmoticons() : Vector.<GuildChatEmoticon>
      {
         var _loc2_:* = null;
         if(_allEmoticons)
         {
            return _allEmoticons;
         }
         _allEmoticons = new Vector.<GuildChatEmoticon>();
         var _loc4_:int = 0;
         var _loc3_:* = CEmoticon.ids;
         for each(var _loc1_ in CEmoticon.ids)
         {
            _loc2_ = new GuildChatEmoticon(_loc1_);
            _allEmoticons.push(_loc2_);
         }
         _allEmoticons.sort(sortByIndex);
         return _allEmoticons;
      }
      
      private static function sortByIndex(param1:GuildChatEmoticon, param2:GuildChatEmoticon) : int
      {
         return param1.index > param2.index?1:-1;
      }
      
      public function get identifier() : String
      {
         return _identifier;
      }
      
      public function get codes() : Vector.<String>
      {
         if(_codes)
         {
            return _codes;
         }
         _codes = CEmoticon.fromId(_identifier).codes;
         return _codes;
      }
      
      public function get isHidden() : Boolean
      {
         return CEmoticon.fromId(_identifier).hidden;
      }
      
      public function get index() : int
      {
         return CEmoticon.fromId(_identifier).index;
      }
      
      public function get imageUrl() : String
      {
         return "SymbolEmoticonBitmaps" + StringUtil.capitaliseFirstLetter(_identifier);
      }
      
      public function get imageUrlBig() : String
      {
         return ServerInfo.assetURL("emoticons_big/" + _identifier,"png");
      }
   }
}
