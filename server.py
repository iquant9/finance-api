import pandas as pd
from sanic import Sanic, Blueprint, json, text, SanicException
import qstock
import akshare
import Ashare
from sanic.log import logger

bp = Blueprint("my_blueprint")

app = Sanic(__name__)
app.blueprint(bp)
# output http error as json format
app.config.FALLBACK_ERROR_FORMAT = "json"
# More detailed description abount http error
app.config.DEBUG = True


@bp.route("/eval")
async def bp_eval(request):
    cmd = request.args.get("cmd")
    logger.info('cmd is %s' % cmd)

    try:
        df = eval(cmd)
    except Exception as e:
        raise SanicException(str(e), status_code=501)
    logger.info('df len is %d' % len(df))

    # df = qstock.realtime_data()
    response = df.to_json(orient='records', force_ascii=False)
    # 查看前几行
    return text(response)


# http://127.0.0.1:8000/eval?cmd=qstock.realtime_data()
# stock_info_a_code_name
if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8011)
