//Created  on 2018/11/5  by LCD :https://github.com/liucaide .

import Foundation
import MJRefresh

//MARK:--- MJRefreshNormalHeader 重设置 ----------

public extension CD where Base: MJRefreshNormalHeader {
    
    var activityStyle:UIActivityIndicatorView.Style {
        set{
            base.activityIndicatorViewStyle = newValue
        }
        get{
            return base.activityIndicatorViewStyle
        }
    }
    /// 设置菊花样式
    @discardableResult
    func activityStyle(_ t:UIActivityIndicatorView.Style = .gray) -> CD{
        base.activityIndicatorViewStyle = t
        return self
    }
}
public extension CD where Base: MJRefreshStateHeader {
    /// 设置文字
    @discardableResult
    func setTitle(isHidden:Bool = true,
                  font:UIFont = UIFont.systemFont(ofSize: 14),
                  color:UIColor = UIColor.lightGray,
                  inset:CGFloat = 0,
                  title:[CD_MJRefreshModel.TitlesEnum] = [.idle(""),
                                                          .pulling(""),
                                                          .refreshing(""),
                                                          .willRefresh(""),
                                                          .noMoreData(""),]
        ) -> CD
    {
        base.stateLabel.isHidden = isHidden
        guard !isHidden else {
            return self
        }
        for item in title {
            switch item {
            case .idle(let t):
                base.setTitle(t, for: .idle)
            case .pulling(let t):
                base.setTitle(t, for: .pulling)
            case .refreshing(let t):
                base.setTitle(t, for: .refreshing)
            case .willRefresh(let t):
                base.setTitle(t, for: .willRefresh)
            case .noMoreData(let t):
                base.setTitle(t, for: .noMoreData)
            }
        }
        base.labelLeftInset = inset
        base.stateLabel.font = font;
        base.stateLabel.textColor = color
        return self
    }
    
    /// 设置时间
    @discardableResult
    func setTime(isHidden:Bool = true,
                 font:UIFont = UIFont.systemFont(ofSize: 12),
                 color:UIColor = UIColor.lightGray,
                 timeText:((Date)->(String))? = nil
        ) -> CD
    {
        base.lastUpdatedTimeLabel.isHidden = isHidden
        guard !isHidden else {
            return self
        }
        base.lastUpdatedTimeLabel.font = font
        base.lastUpdatedTimeLabel.textColor = color
        base.lastUpdatedTimeText = { (date) -> String in
            return timeText?(date ?? Date()) ?? ""
        }
        return self
    }
}
public let imagessssss:[UIImage] = (0..<8).map{UIImage(named: "refresh_\($0)") ?? UIImage()}

//MARK:--- MJRefreshGifHeader 重设置 ----------
public extension CD where Base: MJRefreshGifHeader {
    
    /// 设置时间
    @discardableResult
    func setImages(_ images:[CD_MJRefreshModel.ImagesEnum] = [.idle(imagessssss),
                                                              .pulling(imagessssss),
                                                              .willRefresh(imagessssss),
                                                              .refreshing(imagessssss),
                                                              .noMoreData(imagessssss)]
        ) -> CD
    {
        for item in images {
            switch item {
            case .idle(let t):
                base.setImages(t, for: .idle)
            case .pulling(let t):
                base.setImages(t, for: .pulling)
            case .refreshing(let t):
                base.setImages(t, for: .refreshing)
            case .willRefresh(let t):
                base.setImages(t, for: .willRefresh)
            case .noMoreData(let t):
                base.setImages(t, for: .noMoreData)
            }
        }
        return self
    }
}
