enum HomeBarType { following, forYou, stories }

enum Language { english, arabic, other }

enum ApiState { initial, loading, finished }

enum ProfileStatus { private, public, none }

enum PostActions { add, edit }

enum MediaType { image, video, none }

enum ApiProgress { loading, completed, error, none }

enum CameraState { imageShowing, videoShowing, none }

enum ScreenFrom { profile, bookmark, recommended, activity, home, private,search, chat }

enum AssetStorage { file, url }

enum CommentType { post, comment, hashtag }

enum CreatedFor { post, hashtag }

enum HashtagActions { add, edit, repost }

enum ShareStoryType { public, followers }

enum MediaSourceType { fromFile, fromUrl }

enum MessageType { file, link, other }

enum ShareType { story, post, hashtag, profileDetail }

enum NotificationType {
  postLike,
  postComment,
  postAdded,
  storyLike,
  commentStory,
  storyAdded,
  followRequest,
  followingStarted,
  followBack,
  commentLike,
  commentReplied,
  hashtagLike,
  hashtagComment,
  hashtagAdded,
  none
}
